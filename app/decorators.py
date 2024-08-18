from functools import wraps
from flask import redirect, url_for, flash
from flask_login import current_user


def admin_required(f):
    @wraps(f)
    def decorated_function(*args, **kwargs):
        if current_user.role != "admin":
            flash("You do not have access to this page.", "danger")
            return redirect(url_for("auth.login"))
        return f(*args, **kwargs)

    return decorated_function


def manager_required(f):
    @wraps(f)
    def decorated_function(*args, **kwargs):
        if current_user.role not in ["admin", "manager"]:
            flash("You do not have access to this page.", "danger")
            return redirect(url_for("auth.login"))
        return f(*args, **kwargs)

    return decorated_function


def sales_required(f):
    @wraps(f)
    def decorated_function(*args, **kwargs):
        if current_user.role not in ["admin", "manager", "sales"]:
            flash("You do not have access to this page.", "danger")
            return redirect(url_for("auth.login"))
        return f(*args, **kwargs)

    return decorated_function


def stock_required(f):
    @wraps(f)
    def decorated_function(*args, **kwargs):
        if current_user.role not in ["admin", "manager", "stock"]:
            flash("You do not have access to this page.", "danger")
            return redirect(url_for("auth.login"))
        return f(*args, **kwargs)

    return decorated_function


def trainee_required(f):
    @wraps(f)
    def decorated_function(*args, **kwargs):
        if current_user.role not in ["admin", "manager", "sales", "stock", "trainee"]:
            flash("You do not have access to this page.", "danger")
            return redirect(url_for("auth.login"))
        return f(*args, **kwargs)

    return decorated_function
