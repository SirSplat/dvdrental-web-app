import datetime
import os
import jwt
import sys


def generate_jwt_token(username):
    secret = os.getenv("JWT_SECRET")
    if not secret:
        print("JWT_SECRET is not set in the environment.")
        return

    payload_data = {
        "role": username,
        "exp": datetime.datetime.utcnow() + datetime.timedelta(hours=1),
    }
    token = jwt.encode(payload=payload_data, key=secret, algorithm="HS256")
    print(token)


if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Please provide a username as an argument.")
    else:
        username = sys.argv[1]
        generate_jwt_token(username)
