```sh
python3 -m venv venv
source venv/bin/activate.fish
pip install -r requirements.txt
uvicorn main:app --reload --host 0.0.0.0
# Dockerize
docker build -t fastapi-chat .
docker run -d --name fastapi-chat -p 8000:8000 fastapi-chat
```

# Step 2

````md
1. Add SQLite storage at data/messages.db for from,to,msg,timestamp, msg is limited to 4096 chars
2. add methods from client via websocket to load slice of messages from/to other users associated with current user (from_username) in both from and to fields by time limit start_time,end_time timestamps, e.g. request: {"cmd":"history","from":1720000189617,"to":1720004189617} to get slice of messages, response: [{"from": "jjttKYFgoLlVy+/Xl9c7+Vibfo4oFlhdTTmlAqQGFro=","msg": "EfKcqvWksvXPUY0Gk6rlbjmiUBJGzqic6vC/zps4jRI=","timestamp": 1720004189617, "to": "WlsOd1qm+llUMdW//IQUmcWFWrlfA+CA1uqL1nxG8pw="}]

Update main.py backend part so that:

1. update SQL entry to delivered=1 after being delivered once
   2.store all messages there not only once that were not delivered
2. move ConnectionMaanger to another file db.py
3. check {"cmd":"history","from":0,"to":99999999999999999999} if to and for OverflowError: Python int too large to convert to SQLite INTEGER. If from and to is not provided (consider -1 passed) just load till the latest message

now move encryption/decryption and formation encrypted messages to message.py

```json
[
  {
    "from": "\u041a\u043e\u043b\u044f",
    "to": "\u041c\u0430\u0448\u0430",
    "msg": "\u041f\u0440\u0438\u0432\u0435\u0442, \u041c\u0430\u0448\u0430!",
    "timestamp": 1720005002093
  }
]
```
````

so that from, to, msg fields from get_message_history should be encrypted as well

Update webchat app so that:

1. when opening a webpage it automatically connects to that username if localStorage.getItem('from') is set
2. when changing a username it closes a previous websocket connection
3. First it loads previous messages from Date.now() - 1hour, then after 10secs from Date().now() - 8hours, to: from Date.now() - 1hour, then after 10 secs from from Date.now() - 1 day, to : from Date.now() - 8hours. Make sure there are no duplicates and sort all messages so that at the bottom there are newest ones and scroll down to the latest message
4. At the other side of a message bubble row add human readable datetime "%Y-%m-%d %H:%M:%S" and username

change db.py so that:

```sql
    CREATE TABLE IF NOT EXISTS messages (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        sender TEXT,
        receiver TEXT,
        message TEXT,
        timestamp INTEGER,
        delivered BOOLEAN DEFAULT 0
    )
```

wouldn't have id as a PRIMARY KEY but (sender, receiver, timestamp) as a PRIMARY KEY, sender and receiver as VARCHAR(64) and indexed fields
