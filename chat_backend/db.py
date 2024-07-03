import sqlite3
from typing import Dict
from fastapi import WebSocket
from datetime import datetime, timedelta
import threading
import time
import json  # Import json module
from lunardate import LunarDate
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
cursor.execute(
    """
    CREATE TABLE IF NOT EXISTS users (
        uuid VARCHAR(64) PRIMARY KEY,
        username VARCHAR(64) UNIQUE,
        email VARCHAR,
        password VARCHAR,
        otp VARCHAR,
        online_time INTEGER,
        register_time INTEGER,
        birth VARCHAR,
        type1 INTEGER,
        type2 INTEGER,
        children INTEGER,
        prev_partner_birth VARCHAR,
        gender CHAR(1) DEFAULT 'M',
        last_days_activity INTEGER DEFAULT 0,
        FOREIGN KEY (type1) REFERENCES users_type (id),
        FOREIGN KEY (type2) REFERENCES users_type (id)
    )
"""
)
cursor.execute(
    """
    CREATE TABLE IF NOT EXISTS users_type (
        id INTEGER PRIMARY KEY,
        type_name TEXT UNIQUE
    )
"""
)
cursor.execute(
    """
    INSERT OR IGNORE INTO users_type (id, type_name) VALUES
    (0, 'words'),
    (1, 'touch'),
    (2, 'gifts'),
    (3, 'time'),
    (4, 'service')
"""
)
cursor.execute(
    """
    CREATE TABLE IF NOT EXISTS user_zodiacs (
        uuid VARCHAR(64) PRIMARY KEY,
        year_of_birth INTEGER,
        astrological_sign TEXT,
        chinese_zodiac TEXT,
        FOREIGN KEY (uuid) REFERENCES users (uuid)
    )
"""
)
cursor.execute(
    """
    CREATE TABLE IF NOT EXISTS requirements (
        uuid VARCHAR(64),
        year_from INTEGER,
        year_to INTEGER,
        FOREIGN KEY(uuid) REFERENCES users(uuid)
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


def calculate_astrological_sign(date_string):
    month_day = date_string[3:5] + "-" + date_string[0:2]
    if "03-21" <= month_day <= "04-19":
        return "Aries"
    elif "04-20" <= month_day <= "05-20":
        return "Taurus"
    elif "05-21" <= month_day <= "06-20":
        return "Gemini"
    elif "06-21" <= month_day <= "07-22":
        return "Cancer"
    elif "07-23" <= month_day <= "08-22":
        return "Leo"
    elif "08-23" <= month_day <= "09-22":
        return "Virgo"
    elif "09-23" <= month_day <= "10-22":
        return "Libra"
    elif "10-23" <= month_day <= "11-21":
        return "Scorpio"
    elif "11-22" <= month_day <= "12-21":
        return "Sagittarius"
    elif "12-22" <= month_day <= "01-19":
        return "Capricorn"
    elif "01-20" <= month_day <= "02-18":
        return "Aquarius"
    elif "02-19" <= month_day <= "03-20":
        return "Pisces"
    return None


def calculate_chinese_zodiac(date_string):
    gregorian_date = datetime.strptime(date_string, "%d-%m-%Y")
    lunar_date = LunarDate.fromSolarDate(
        gregorian_date.year, gregorian_date.month, gregorian_date.day
    )
    return lunar_date.animal


def update_user_zodiacs():
    cursor.execute("SELECT uuid, birth FROM users")
    rows = cursor.fetchall()
    for row in rows:
        uuid, birth = row
        year_of_birth = int(birth[-4:])
        astrological_sign = calculate_astrological_sign(birth)
        chinese_zodiac = calculate_chinese_zodiac(birth)
        cursor.execute(
            """
            INSERT OR REPLACE INTO user_zodiacs (uuid, year_of_birth, astrological_sign, chinese_zodiac)
            VALUES (?, ?, ?, ?)
            """,
            (uuid, year_of_birth, astrological_sign, chinese_zodiac),
        )
    conn.commit()


update_user_zodiacs()


def cleanup_old_messages():
    while True:
        cutoff_time = datetime.now() - timedelta(days=5)
        cutoff_timestamp = int(cutoff_time.timestamp() * 1000)
        cursor.execute("DELETE FROM messages WHERE timestamp < ?", (cutoff_timestamp,))
        conn.commit()
        time.sleep(24 * 3600)  # Run cleanup once a day
