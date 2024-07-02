```sh
python3 -m venv venv
source venv/bin/activate.fish
pip install -r requirements.txt
uvicorn main:app --reload --host 0.0.0.0
# Dockerize
docker build -t fastapi-chat .
docker run -d --name fastapi-chat -p 8000:8000 fastapi-chat
```
