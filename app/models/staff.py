from app import db
from app.pg_types import VARCHAR


class Staff(db.Model):
    __tablename__ = "staff"
    __table_args__ = {"schema": "rental"}

    staff_id = db.Column(
        db.Integer,
        primary_key=True,
        server_default=db.text("nextval('staff_staff_id_seq'::regclass)"),
    )
    first_name = db.Column(VARCHAR(45), nullable=False)
    last_name = db.Column(VARCHAR(45), nullable=False)
    address_id = db.Column(
        db.ForeignKey("address.address_id", ondelete="RESTRICT", onupdate="CASCADE"),
        nullable=False,
    )
    email = db.Column(VARCHAR(50))
    store_id = db.Column(db.SmallInteger, nullable=False)
    active = db.Column(db.Boolean, nullable=False, server_default=db.text("true"))
    username = db.Column(VARCHAR(16), nullable=False)
    password = db.Column(VARCHAR(40))
    last_update = db.Column(
        db.DateTime, nullable=False, server_default=db.text("now()")
    )
    picture = db.Column(db.Text)
    role_type = db.Column(
        db.Text, nullable=False, server_default=db.text("'trainee'::text")
    )

    address = db.relationship("Address")
    store = db.relationship("Store")

    def __repr__(self):
        return f"Staff('{self.first_name}', '{self.last_name}', '{self.email}', '{self.address_id}')"
