from flask import Blueprint, render_template, redirect, url_for, request
from flask_login import login_required, current_user

trainee_bp = Blueprint("trainee", __name__)


@trainee_bp.route("/trainee")
@login_required
def trainee_staff_dashboard():
    if current_user.role != "trainee_staff":
        return redirect(url_for("auth.login"))
    return render_template("trainee_staff_dashboard.html")


# Other trainee-related routes like scan_qr, etc.
