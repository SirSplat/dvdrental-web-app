from flask import Blueprint, render_template, redirect, url_for, request
from flask_login import login_required, current_user

sales_bp = Blueprint("sales", __name__)


@sales_bp.route("/sales_staff")
@login_required
def sales_staff_dashboard():
    if current_user.role != "sales_staff":
        return redirect(url_for("main.login"))
    return render_template("sales_staff_dashboard.html")


# Other sales-related routes like scan_qr, consolidate_sales, etc.
