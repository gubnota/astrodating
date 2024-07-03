from fastapi import APIRouter, Query, HTTPException
from typing import List, Optional
from datetime import datetime
import uuid
from db import cursor, conn
from message import encrypt_message, decrypt_message

router = APIRouter()


@router.get("/list")
async def get_users(
    count: int = Query(20, ge=1),
    skip: int = Query(0, ge=0),
    online_time: int = Query(8 * 3600, ge=0),
    gender: Optional[str] = Query(None, max_length=1),
    year_from: Optional[int] = Query(None, ge=1900),
    year_to: Optional[int] = Query(None, le=datetime.now().year),
    astrological_signs: Optional[List[str]] = Query(None),
):
    query = """
    SELECT 
        users.username,
        users.uuid,
        users.online_time,
        users.birth,
        users.type1,
        users.type2
    FROM users
    JOIN user_zodiacs ON users.uuid = user_zodiacs.uuid
    WHERE users.online_time < ?
    """

    params = [online_time]

    if gender:
        query += " AND users.gender = ?"
        params.append(gender)

    if year_from:
        query += " AND user_zodiacs.year_of_birth >= ?"
        params.append(year_from)

    if year_to:
        query += " AND user_zodiacs.year_of_birth <= ?"
        params.append(year_to)

    if astrological_signs:
        query += " AND user_zodiacs.astrological_sign IN ({})".format(
            ",".join(["?"] * len(astrological_signs))
        )
        params.extend(astrological_signs)

    query += " ORDER BY users.last_days_activity DESC, users.online_time ASC LIMIT ? OFFSET ?"
    params.extend([count, skip])

    cursor.execute(query, params)
    rows = cursor.fetchall()

    users = []
    for row in rows:
        users.append(
            {
                "username": encrypt_message(row[0]),
                "uuid": encrypt_message(row[1]),
                "online_time": row[2],
                "birth": encrypt_message(row[3]),
                "type1": encrypt_message(row[4]),
                "type2": encrypt_message(row[5]),
            }
        )

    cursor.execute("SELECT COUNT(*) FROM users")
    total_count = cursor.fetchone()[0]

    return {"users": users, "total_count": encrypt_message(str(total_count))}


@router.post("/create")
async def create_user(username: str, email: str):
    user_uuid = str(uuid.uuid4())
    cursor.execute(
        """
        INSERT INTO users (uuid, username, email, register_time)
        VALUES (?, ?, ?, ?)
        """,
        (user_uuid, username, email, int(datetime.now().timestamp())),
    )
    conn.commit()
    return {"msg": "User created", "uuid": user_uuid}


@router.post("/update")
async def update_user(
    uuid: str, email: Optional[str] = None, online_time: Optional[int] = None
):
    if email is None and online_time is None:
        raise HTTPException(status_code=400, detail="No fields to update")

    update_fields = []
    params = []

    if email:
        update_fields.append("email = ?")
        params.append(email)

    if online_time:
        update_fields.append("online_time = ?")
        params.append(online_time)

    query = f"UPDATE users SET {', '.join(update_fields)} WHERE uuid = ?"
    params.append(uuid)

    cursor.execute(query, params)
    conn.commit()
    return {"msg": "User updated"}
