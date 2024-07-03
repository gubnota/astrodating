import sqlite3
from typing import Dict
from fastapi import WebSocket
from datetime import datetime, timedelta
import threading
import time
import json  # Import json module
from message import encrypt_message, decrypt_message

# SQLite setup
conn = sqlite3.connect("data/messages.db", check_same_thread=False)
cursor = conn.cursor()
cursor.execute(
    """
    CREATE TABLE IF NOT EXISTS messages (
        sender VARCHAR(64),
        receiver VARCHAR(64),
        message TEXT,
        timestamp INTEGER,
        delivered BOOLEAN DEFAULT 0,
        PRIMARY KEY (sender, receiver, timestamp)
    )
"""
)
cursor.execute(
    """
    CREATE INDEX IF NOT EXISTS idx_sender ON messages (sender)
"""
)
cursor.execute(
    """
    CREATE INDEX IF NOT EXISTS idx_receiver ON messages (receiver)
"""
)
conn.commit()


class ConnectionManager:
    def __init__(self):
        self.active_connections: Dict[str, WebSocket] = {}

    async def connect(self, websocket: WebSocket, username: str):
        await websocket.accept()
        self.active_connections[username] = websocket

    def disconnect(self, username: str):
        self.active_connections.pop(username, None)

    async def send_personal_message(self, message: dict, username: str):
        if username in self.active_connections:
            await self.active_connections[username].send_text(json.dumps(message))
            self.mark_message_as_delivered(
                message["from"], message["to"], message["timestamp"]
            )

    async def broadcast(self, message: str):
        for connection in self.active_connections.values():
            await connection.send_text(message)

    def mark_message_as_delivered(self, sender: str, receiver: str, timestamp: int):
        cursor.execute(
            "UPDATE messages SET delivered = 1 WHERE sender = ? AND receiver = ? AND timestamp = ?",
            (sender, receiver, timestamp),
        )
        conn.commit()


def get_message_history(username: str, start_time: int, end_time: int):
    if start_time < 0:
        start_time = 0
    if end_time < 0:
        end_time = 9223372036854775807

    if end_time > 9223372036854775807:  # SQLite INTEGER max value
        end_time = 9223372036854775807

    cursor.execute(
        """
        SELECT sender, receiver, message, timestamp FROM messages
        WHERE (sender = ? OR receiver = ?) AND timestamp BETWEEN ? AND ?
    """,
        (username, username, start_time, end_time),
    )
    rows = cursor.fetchall()
    history = []
    for row in rows:
        history.append(
            {
                "from": encrypt_message(row[0]),
                "to": encrypt_message(row[1]),
                "msg": encrypt_message(row[2]),
                "timestamp": row[3],
            }
        )
    return history


def save_message(sender: str, receiver: str, message: str, timestamp: int):
    cursor.execute(
        """
        INSERT INTO messages (sender, receiver, message, timestamp, delivered)
        VALUES (?, ?, ?, ?, 0)
    """,
        (sender, receiver, message, timestamp),
    )
    conn.commit()


def cleanup_old_messages():
    while True:
        cutoff_time = datetime.now() - timedelta(days=5)
        cutoff_timestamp = int(cutoff_time.timestamp() * 1000)
        cursor.execute("DELETE FROM messages WHERE timestamp < ?", (cutoff_timestamp,))
        conn.commit()
        time.sleep(24 * 3600)  # Run cleanup once a day
