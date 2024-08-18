import logging

from flask import Blueprint, flash, redirect, render_template, request, url_for
from flask_login import login_required, login_user, logout_user

from . import bcrypt, db
from .models import User

main = Blueprint("main", __name__)


@main.route("/")
def home():
    return "Welcome to DVD Rental Sample Database!"


@main.route("/register", methods=["GET", "POST"])
def register():
    if request.method == "POST":
        username = request.form.get("username")
        email = request.form.get("email")
        password = request.form.get("password")
        hashed_password = bcrypt.generate_password_hash(password).decode("utf-8")
        user = User(username=username, email=email, password=hashed_password)
        db.session.add(user)
        db.session.commit()
        flash("Account created! Please log in.", "success")
        return redirect(url_for("main.login"))
    return render_template("register.html")


@main.route("/login", methods=["GET", "POST"])
def login():
    try:
        if request.method == "POST":
            email = request.form.get("email")
            password = request.form.get("password")
            user = User.query.filter_by(email=email).first()
            if user and bcrypt.check_password_hash(user.password, password):
                login_user(user)
                if user.role == "admin":
                    return redirect(url_for("main.admin_staff_dashboard"))
                elif user.role == "manager":
                    return redirect(url_for("main.manager_staff_dashboard"))
                elif user.role == "sales_staff":
                    return redirect(url_for("main.sales_staff_dashboard"))
                elif user.role == "stock_staff":
                    return redirect(url_for("main.stock_staff_dashboard"))
                elif user.role == "trainee_staff":
                    return redirect(url_for("main.trainee_staff_dashboard"))
            else:
                flash("Login Unsuccessful. Please check email and password", "danger")
        return render_template("login.html")
    except Exception as e:
        logging.error(f"Error during login: {str(e)}")
        return "An error occurred", 500


@main.route("/dashboard")
@login_required
def dashboard():
    return "Logged in successfully!"


@main.route("/logout")
@login_required
def logout():
    logout_user()
    return redirect(url_for("main.login"))


@main.route("/admin")
@login_required
def admin_staff_dashboard():
    if current_user.role != "admin":
        return redirect(url_for("main.login"))
    return render_template("admin_staff_dashboard.html")


@main.route("/manager")
@login_required
def manager_staff_dashboard():
    if current_user.role not in ["admin", "manager"]:
        return redirect(url_for("main.login"))
    return render_template("manager_staff_dashboard.html")


@main.route("/sales_staff")
@login_required
def sales_staff_dashboard():
    if current_user.role != "sales_staff":
        return redirect(url_for("main.login"))
    return render_template("sales_staff_dashboard.html")


@main.route("/stock_staff")
@login_required
def stock_staff_dashboard():
    if current_user.role != "stock_staff":
        return redirect(url_for("main.login"))
    return render_template("stock_staff_dashboard.html")


@main.route("/trainee_staff")
@login_required
def stock_staff_dashboard():
    if current_user.role != "trainee_staff":
        return redirect(url_for("main.login"))
    return render_template("trainee_staff_dashboard.html")


@main.route("/add_user", methods=["GET", "POST"])
@login_required
def add_user():
    if current_user.role != "admin":
        return redirect(url_for("main.login"))
    if request.method == "POST":
        # Logic to add user
        pass
    return render_template("add_user.html")
