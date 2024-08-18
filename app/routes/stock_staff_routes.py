from flask import Blueprint, render_template, redirect, url_for, request
from flask_login import login_required, current_user

stock_bp = Blueprint("stock", __name__)


@stock_bp.route("/stock_staff")
@login_required
def stock_staff_dashboard():
    if current_user.role != "stock_staff":
        return redirect(url_for("main.login"))
    return render_template("stock_staff_dashboard.html")


# Other stock-related routes like scan_qr_stock, consolidate_stock, etc.
