from flask_login import UserMixin

from . import db


class User(UserMixin, db.Model):
    __tablename__ = "user"
    __table_args__ = {"schema": "rental"}
    user_id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(150), unique=True, nullable=False)
    email = db.Column(db.String(150), unique=True, nullable=False)
    password = db.Column(db.String(60), nullable=False)
    role = db.Column(db.String(50), nullable=False, default="trainee")

    def get_id(self):
        return str(self.user_id)

    def __repr__(self):
        return f"User('{self.username}', '{self.email}', '{self.role}')"
