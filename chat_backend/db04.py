import sqlite3
from typing import Dict
from fastapi import WebSocket

# SQLite setup
conn = sqlite3.connect("data/messages.db", check_same_thread=False)
cursor = conn.cursor()
cursor.execute(
    """
    CREATE TABLE IF NOT EXISTS messages (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        sender TEXT,
        receiver TEXT,
        message TEXT,
        timestamp INTEGER,
        delivered BOOLEAN DEFAULT 0
    )
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

    async def send_personal_message(self, message: str, username: str):
        if username in self.active_connections:
            await self.active_connections[username].send_text(message)
            cursor.execute(
                "UPDATE messages SET delivered = 1 WHERE sender = ? AND receiver = ? AND timestamp = ?",
                (message["from"], message["to"], message["timestamp"]),
            )
            conn.commit()

    async def broadcast(self, message: str):
        for connection in self.active_connections.values():
            await connection.send_text(message)


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
                "from": row[0],
                "to": row[1],
                "msg": row[2],
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
