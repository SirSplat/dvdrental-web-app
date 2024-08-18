from app import db
from app.pg_types import VARCHAR


class Actor(db.Model):
    __tablename__ = "actor"
    __table_args__ = {"schema": "rental"}

    actor_id = db.Column(
        db.Integer,
        primary_key=True,
        server_default=db.text("nextval('actor_actor_id_seq'::regclass)"),
    )
    first_name = db.Column(VARCHAR(45), nullable=False)
    last_name = db.Column(VARCHAR(45), nullable=False, index=True)
    last_update = db.Column(
        db.DateTime, nullable=False, server_default=db.text("now()")
    )

    def __repr__(self):
        return f"Actor('{self.first_name}', '{self.last_name}')"
