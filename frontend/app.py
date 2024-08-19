# frontend/app.py (Flask)
import os

import requests
from flask import Flask, flash, redirect, render_template, request, url_for

app = Flask(__name__)
app.secret_key = os.getenv("FLASK_SECRET_KEY")


@app.route("/")
def home():
    return render_template("home.html")


@app.route("/login", methods=["GET", "POST"])
def login():
    if request.method == "POST":
        username = request.form["username"]
        password = request.form["password"]

        # Send credentials to the FastAPI backend
        response = requests.post(
            "http://backend:8000/login",
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
