import datetime
import os
import sys

import jwt
from dotenv import load_dotenv

# Load environment variables from .env file
load_dotenv()


def get_jwt_secret():
    secret = os.getenv("JWT_SECRET")
    if not secret:
        raise ValueError(f"No JWT secret found in environment variables.")
    return secret


def create_jwt_token(username):
    secret = get_jwt_secret()
    expiration = datetime.datetime.utcnow() + datetime.timedelta(hours=1)
    token = jwt.encode({"sub": username, "exp": expiration}, secret, algorithm="HS256")
    return token


if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Please provide a username as an argument.")
    else:
        username = sys.argv[1]
        token = create_jwt_token(username)
        print(token)