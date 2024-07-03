import json
from fastapi import FastAPI, WebSocket, WebSocketDisconnect, Path
from fastapi.middleware.cors import CORSMiddleware
import threading
from db import (
    ConnectionManager,
    get_message_history,
    save_message,
    cleanup_old_messages,
)
from message import decrypt_message, form_encrypted_message
from users import router as users_router

app = FastAPI()

origins = ["*"]

app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

manager = ConnectionManager()

app.include_router(users_router, prefix="/users")


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

                message_dict = {
                    "from": decrypted_from,
                    "to": decrypted_to,
                    "msg": decrypted_msg,
                    "timestamp": timestamp,
                }

                if decrypted_to in manager.active_connections:
                    encrypted_message = form_encrypted_message(message_dict)
                    await manager.send_personal_message(encrypted_message, decrypted_to)
                    # Mark the message as delivered
                    manager.mark_message_as_delivered(
                        decrypted_from, decrypted_to, timestamp
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
