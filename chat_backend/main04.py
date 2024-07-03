from fastapi import FastAPI, WebSocket, WebSocketDisconnect, Path
from fastapi.middleware.cors import CORSMiddleware
from typing import List, Dict
from cryptography.hazmat.primitives.ciphers import Cipher, algorithms, modes
from cryptography.hazmat.primitives import padding
from cryptography.hazmat.backends import default_backend
import base64
import json
import os
from datetime import datetime, timedelta
import threading
import time
from db import (
    ConnectionManager,
    get_message_history,
    save_message,
    cleanup_old_messages,
)

app = FastAPI()

origins = ["*"]

app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Correctly convert the hex string to a bytes object
AES_KEY = bytes.fromhex(
    "e845da978c2696955e3025555eb125c1c62ddc511dd288b8fce7a88648534349"
)  # Replace with your actual 32-byte AES key

manager = ConnectionManager()


def encrypt_message(message: str) -> str:
    iv = os.urandom(16)  # Generate a random IV
    cipher = Cipher(algorithms.AES(AES_KEY), modes.CBC(iv), backend=default_backend())
    encryptor = cipher.encryptor()
    padder = padding.PKCS7(128).padder()
    padded_data = padder.update(message.encode("utf-8")) + padder.finalize()
    encrypted = encryptor.update(padded_data) + encryptor.finalize()
    return base64.b64encode(iv + encrypted).decode(
        "utf-8"
    )  # Prepend the IV and base64 encode


def decrypt_message(encrypted_message: str) -> str:
    try:
        encrypted_data = base64.b64decode(encrypted_message)
        iv = encrypted_data[:16]  # Extract the IV
        encrypted_message = encrypted_data[16:]  # Extract the encrypted message
        cipher = Cipher(
            algorithms.AES(AES_KEY), modes.CBC(iv), backend=default_backend()
        )
        decryptor = cipher.decryptor()
        decrypted_padded = decryptor.update(encrypted_message) + decryptor.finalize()
        unpadder = padding.PKCS7(128).unpadder()
        decrypted = unpadder.update(decrypted_padded) + unpadder.finalize()
        return decrypted.decode("utf-8")
    except Exception as e:
        print(f"Decryption error: {e}")
        return ""


@app.websocket("/astrodating/chat/{encrypted_username:path}")
async def websocket_endpoint(
    websocket: WebSocket, encrypted_username: str = Path(..., regex=".*")
):
    username = decrypt_message(encrypted_username)
    await manager.connect(websocket, username)
    try:
        while True:
            data = await websocket.receive_text()
            data_json = json.loads(data)

            if data_json.get("cmd") == "history":
                start_time = data_json.get("from", -1)
                end_time = data_json.get("to", -1)
                history = get_message_history(username, start_time, end_time)
                await websocket.send_text(json.dumps(history))
            else:
                decrypted_from = decrypt_message(data_json["from"])
                decrypted_to = decrypt_message(data_json["to"])
                decrypted_msg = decrypt_message(data_json["msg"])
                timestamp = data_json["timestamp"]

                if decrypted_to in manager.active_connections:
                    message = {
                        "msg": encrypt_message(decrypted_msg),
                        "from": encrypt_message(decrypted_from),
                        "to": encrypt_message(decrypted_to),
                        "timestamp": timestamp,
                    }
                    await manager.send_personal_message(
                        json.dumps(message), decrypted_to
                    )
                save_message(decrypted_from, decrypted_to, decrypted_msg, timestamp)
    except WebSocketDisconnect:
        manager.disconnect(username)


# Add a route for health check
@app.get("/")
async def root():
    return {"message": "Chat backend is running"}


# Start the cleanup thread
cleanup_thread = threading.Thread(target=cleanup_old_messages, daemon=True)
cleanup_thread.start()
