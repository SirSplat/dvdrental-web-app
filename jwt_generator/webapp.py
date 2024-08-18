import datetime
import os

import jwt

secret = os.getenv("JWT_SECRET")
payload_data = {
    "role": "webapp_user",
    "exp": datetime.datetime.utcnow() + datetime.timedelta(hours=1),
}
token = jwt.encode(payload=payload_data, key=secret, algorithm="HS256")

print(token)
