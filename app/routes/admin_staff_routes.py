from flask import Blueprint, flash, redirect, render_template, request, url_for
from flask_login import login_required

from .. import bcrypt, db
from ..decorators import admin_required
from ..models import User
from ..utils import create_user

admin_bp = Blueprint("admin", __name__)
dashboard = "admin_staff_dashboard"


@admin_bp.route("/admin")
@login_required
@admin_required
def admin_staff_dashboard():
    return render_template(f"{dashboard}.html")


@admin_bp.route("/add_user", methods=["GET", "POST"])
@login_required
@admin_required
def add_user():
    if request.method == "POST":
        username = request.form.get("username")
        email = request.form.get("email")
        password = request.form.get("password")
        role = request.form.get("role")

        user = create_user(username, email, password, role)

        if user:
            return redirect(url_for(f"admin.{dashboard}"))

    return render_template("add_user.html")


@admin_bp.route("/remove_user", methods=["GET", "POST"])
@login_required
@admin_required
def remove_user():
    if request.method == "POST":
        selected_users = request.form.getlist("selected_users")
        for user_id in selected_users:
            user = User.query.get(user_id)
            if user:
                db.session.delete(user)
        db.session.commit()
        flash("Selected users removed successfully!", "success")
        return redirect(url_for("admin.remove_user"))

    users = User.query.all()  # Fetch all users for admin
    return render_template("remove_user.html", users=users)


@admin_bp.route("/change_password", methods=["GET", "POST"])
@login_required
@admin_required
def change_password():
    if request.method == "POST":
        user_id = request.form.get("user_id")
        new_password = request.form.get("new_password")
        user = User.query.get(user_id)
        if user:
            user.password = bcrypt.generate_password_hash(new_password).decode("utf-8")
            db.session.commit()
            flash("Password changed successfully!", "success")
            return redirect(url_for("admin.change_password"))
        else:
            flash("User not found.", "danger")

    users = User.query.all()  # Fetch all users for admin
    return render_template("change_password.html", users=users)


# Other admin-related routes like add_user, remove_user, etc.
