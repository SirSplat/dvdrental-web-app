from app import db
from app.pg_types import VARCHAR


class Category(db.Model):
    __tablename__ = "category"
    __table_args__ = {"schema": "rental"}

    category_id = db.Column(
        db.Integer,
        primary_key=True,
        server_default=db.text("nextval('category_category_id_seq'::regclass)"),
    )
    name = db.Column(VARCHAR(25), nullable=False)
    last_update = db.Column(db.DateTime, nullable=False, server_default=db.text("now()"))

    def __repr__(self):
        return f"Category('{self.name}')"
