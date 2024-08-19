# backend/app.py (FastAPI)
import datetime
import os

import jwt
import requests
from dotenv import load_dotenv
from fastapi import FastAPI, HTTPException
from pydantic import BaseModel

# Load environment variables from .env file
load_dotenv()

app = FastAPI()

# Replace with your secret key for signing JWTs
SECRET_KEY = os.getenv("JWT_SECRET")


class LoginData(BaseModel):
    username: str
    password: str


@app.post("/login")
def login(data: LoginData):
    # Example of how you might validate credentials via PostgREST
    response = requests.post(
        "http://postgrest:3000/rpc/login_function",
        json={"username": data.username, "password": data.password},
    )

    if response.status_code == 200 and response.json().get("valid"):
        # Create JWT token
        expiration = datetime.datetime.utcnow() + datetime.timedelta(hours=1)
        token = jwt.encode(
            {"sub": data.username, "exp": expiration}, SECRET_KEY, algorithm="HS256"
        )
        return {"access_token": token}
    else:
        raise HTTPException(status_code=401, detail="Invalid credentials")
