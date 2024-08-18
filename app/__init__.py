from flask import Flask
from flask_bcrypt import Bcrypt
from flask_login import LoginManager
from flask_sqlalchemy import SQLAlchemy
from .config import Config

db = SQLAlchemy()
bcrypt = Bcrypt()
login_manager = LoginManager()


def create_app():
    app = Flask(__name__)
    app.config.from_object(Config)

    # Initialize extensions
    db.init_app(app)
    bcrypt.init_app(app)
    login_manager.init_app(app)

    # Log the DATABASE_URL being used
    print(f"Connecting to database with URL: {app.config['SQLALCHEMY_DATABASE_URI']}")

    # Register the blueprints
    from .routes.home_routes import main_bp
    from .routes.auth_routes import auth_bp
    from .routes.admin_staff_routes import admin_bp
    from .routes.manager_staff_routes import manager_bp
    from .routes.sales_staff_routes import sales_bp
    from .routes.stock_staff_routes import stock_bp
    from .routes.trainee_staff_routes import trainee_bp

    app.register_blueprint(main_bp)
    app.register_blueprint(auth_bp)
    app.register_blueprint(admin_bp)
    app.register_blueprint(manager_bp)
    app.register_blueprint(sales_bp)
    app.register_blueprint(stock_bp)
    app.register_blueprint(trainee_bp)

    return app


@login_manager.user_loader
def load_user(user_id):
    from .models import User  # Import User here to avoid circular import

    return User.query.get(int(user_id))
