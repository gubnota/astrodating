from fastapi import FastAPI, WebSocket, WebSocketDisconnect, Path
from fastapi.middleware.cors import CORSMiddleware
from typing import List, Dict
from cryptography.hazmat.primitives.ciphers import Cipher, algorithms, modes
from cryptography.hazmat.primitives import padding
from cryptography.hazmat.backends import default_backend
import base64
import json
import os

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


class ConnectionManager:
    def __init__(self):
        self.active_connections: Dict[str, WebSocket] = {}

    async def connect(self, websocket: WebSocket, username: str):
        await websocket.accept()
        self.active_connections[username] = websocket

    def disconnect(self, username: str):
        self.active_connections.pop(username, None)

    async def send_personal_message(self, message: str, username: str):
        if username in self.active_connections:
            await self.active_connections[username].send_text(message)

    async def broadcast(self, message: str):
        for connection in self.active_connections.values():
            await connection.send_text(message)


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
                await manager.send_personal_message(json.dumps(message), decrypted_to)
    except WebSocketDisconnect:
        manager.disconnect(username)


# Add a route for health check
@app.get("/")
async def root():
    return {"message": "Chat backend is running"}
