# frontend/app.py (Flask)
import os

import requests
from flask import Flask, flash, redirect, render_template, request, session, url_for

app = Flask(__name__)

app.secret_key = os.getenv("JWT_SECRET")
host = os.getenv("FRONTEND_HOST")
port = os.getenv("FRONTEND_PORT")
url = os.getenv("FRONTEND_URL")
debug = os.getenv("FLASK_DEBUG")


@app.route("/")
def home():
    print("Welcome to DVD Rental frontend home page.")
    # return render_template("home.html")


@app.route("/login", methods=["GET", "POST"])
def login():
    if request.method == "POST":
        username = request.form["username"]
        password = request.form["password"]

        # Send credentials to the FastAPI backend
        response = requests.post(
            f"{url}/login",
            json={"username": username, "password": password},
        )

        if response.status_code == 200:
            jwt_token = response.json().get("access_token")
            flash("Login successful!")
            # Store JWT in the session or cookies
            # Example: session['jwt'] = jwt_token
            return redirect(url_for("home"))
        else:
            flash("Login failed. Check your username and password.")
            return redirect(url_for("login"))

    return render_template("login.html")


@app.route("/dashboard")
def dashboard():
    if "access_token" in session:
        return "Welcome to the dashboard!"
    else:
        return redirect(url_for("login"))


if __name__ == "__main__":
    app.run(host=f"{host}", port=f"{port}", debug=debug)
