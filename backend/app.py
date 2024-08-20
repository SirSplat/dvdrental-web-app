import os

import requests
from fastapi import FastAPI, HTTPException
from fastapi.responses import FileResponse
from pydantic import BaseModel
from scripts.handlers.jwt_handler import create_jwt_token

app = FastAPI()
backend_url = os.getenv("BACKEND_URL")


class LoginData(BaseModel):
    username: str
    password: str


@app.get("/")
def read_root():
    return {"message": "Welcome to the backend API"}


@app.get("/favicon.ico")
async def favicon():
    return FileResponse(os.path.join("static", "favicon.ico"))


@app.post("/login")
def login(data: LoginData):
    # Example of how you might validate credentials via PostgREST
    response = requests.post(
        f"{backend_url}/rpc/login_function",
        json={"username": data.username, "password": data.password},
    )

    if response.status_code == 200 and response.json().get("valid"):
        # Create JWT token using the external JWT handler
        token = create_jwt_token(data.username)
        return {"access_token": token}
    else:
        raise HTTPException(status_code=401, detail="Invalid credentials")
