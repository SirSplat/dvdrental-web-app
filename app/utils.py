from flask import flash

from . import bcrypt, db
from .models import User


def create_user(username, email, password, role="trainee"):
    """Creates a new user and adds them to the database."""
    # Check if the user already exists
    existing_user = User.query.filter_by(email=email).first()
    if existing_user:
        flash("Email already exists. Please choose a different one.", "danger")
        return None

    # Hash the password
    hashed_password = bcrypt.generate_password_hash(password).decode("utf-8")

    # Create the new user
    new_user = User(username=username, email=email, password=hashed_password, role=role)

    # Add the user to the database
    db.session.add(new_user)
    db.session.commit()

    flash("User created successfully!", "success")
    return new_user
