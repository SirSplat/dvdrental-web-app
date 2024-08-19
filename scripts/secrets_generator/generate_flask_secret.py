import secrets


def generate_flask_secret_key():
    secret_key = secrets.token_hex(32)
    print(f"FLASK_SECRET_KEY={secret_key}")


if __name__ == "__main__":
    generate_flask_secret_key()
