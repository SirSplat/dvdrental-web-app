import logging

from flask import Blueprint, flash, redirect, render_template, request, url_for
from flask_login import login_required, login_user, logout_user

from .. import bcrypt, db
from ..models import Staff

auth_bp = Blueprint("auth", __name__)


@auth_bp.route("/login", methods=["GET", "POST"])
def login():
    try:
        if request.method == "POST":
            email = request.form.get("email")
            password = request.form.get("password")
            user = Staff.query.filter_by(email=email).first()
            if user and bcrypt.check_password_hash(user.password, password):
                login_user(user)
                return redirect(url_for(f"{user.role}.{user.role}_staff_dashboard"))
            else:
                flash("Login Unsuccessful. Please check email and password", "danger")
        return render_template("login.html")
    except Exception as e:
        logging.error(f"Error during login: {str(e)}")
        return "An error occurred", 500


@auth_bp.route("/register", methods=["GET", "POST"])
def register():
    if request.method == "POST":
        username = request.form.get("username")
        email = request.form.get("email")
        password = request.form.get("password")
        hashed_password = bcrypt.generate_password_hash(password).decode("utf-8")
        user = Staff(username=username, email=email, password=hashed_password)
        db.session.add(user)
        db.session.commit()
        flash("Account created! Please log in.", "success")
        return redirect(url_for("main.login"))
    return render_template("register.html")


@auth_bp.route("/dashboard")
@login_required
def dashboard():
    return "Logged in successfully!"


@auth_bp.route("/logout")
@login_required
def logout():
    logout_user()
    return redirect(url_for("main.login"))
