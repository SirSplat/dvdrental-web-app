from app import db
from app.pg_types import VARCHAR


class Language(db.Model):
    __tablename__ = "language"
    __table_args__ = {"schema": "rental"}

    language_id = db.Column(
        db.Integer,
        primary_key=True,
        server_default=db.text("nextval('language_language_id_seq'::regclass)"),
    )
    name = db.Column(VARCHAR(20), nullable=False)
    last_update = db.Column(
        db.DateTime, nullable=False, server_default=db.text("now()")
    )

    def __repr__(self):
        return f"Language('{self.name}')"
