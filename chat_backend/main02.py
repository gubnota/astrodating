from fastapi import FastAPI, WebSocket, WebSocketDisconnect
from fastapi.middleware.cors import CORSMiddleware
from typing import List, Dict
from cryptography.hazmat.primitives.ciphers import Cipher, algorithms, modes
from cryptography.hazmat.primitives import padding
from cryptography.hazmat.backends import default_backend
import base64
import json
import time

app = FastAPI()

origins = ["*"]

app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

AES_KEY = b"e845da978c2696955e3025555eb125c1c62ddc511dd288b8fce7a88648534349"  # Replace with your actual 32-byte AES key


class ConnectionManager:
    def __init__(self):
        self.active_connections: Dict[str, WebSocket] = {}

    async def connect(self, websocket: WebSocket, session_id: str):
        await websocket.accept()
        self.active_connections[session_id] = websocket

    def disconnect(self, session_id: str):
        self.active_connections.pop(session_id, None)

    async def send_personal_message(self, message: str, session_id: str):
        if session_id in self.active_connections:
            await self.active_connections[session_id].send_text(message)

    async def broadcast(self, message: str):
        for connection in self.active_connections.values():
            await connection.send_text(message)


manager = ConnectionManager()


def encrypt_message(message: str) -> str:
    iv = AES_KEY[:16]
    cipher = Cipher(algorithms.AES(AES_KEY), modes.CBC(iv), backend=default_backend())
    encryptor = cipher.encryptor()
    padder = padding.PKCS7(128).padder()
    padded_data = padder.update(message.encode("utf-8")) + padder.finalize()
    encrypted = encryptor.update(padded_data) + encryptor.finalize()
    return base64.b64encode(encrypted).decode("utf-8")


def decrypt_message(encrypted_message: str) -> str:
    iv = AES_KEY[:16]
    cipher = Cipher(algorithms.AES(AES_KEY), modes.CBC(iv), backend=default_backend())
    decryptor = cipher.decryptor()
    encrypted_data = base64.b64decode(encrypted_message)
    decrypted_padded = decryptor.update(encrypted_data) + decryptor.finalize()
    unpadder = padding.PKCS7(128).unpadder()
    decrypted = unpadder.update(decrypted_padded) + unpadder.finalize()
    return decrypted.decode("utf-8")


@app.websocket("/astrodating/chat/{random_session_device_uuid}")
async def websocket_endpoint(websocket: WebSocket, random_session_device_uuid: str):
    await manager.connect(websocket, random_session_device_uuid)
    try:
        while True:
            data = await websocket.receive_text()
            data_json = json.loads(data)
            decrypted_from = decrypt_message(data_json["from"])
            decrypted_to = decrypt_message(data_json["to"])
            decrypted_msg = decrypt_message(data_json["msg"])
            timestamp = data_json["timestamp"]

            message = {
                "msg": encrypt_message(decrypted_msg),
                "from": encrypt_message(decrypted_from),
                "to": encrypt_message(decrypted_to),
                "timestamp": timestamp,
            }

            await manager.send_personal_message(json.dumps(message), decrypted_to)
    except WebSocketDisconnect:
        manager.disconnect(random_session_device_uuid)
