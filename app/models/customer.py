from app import db
from app.pg_types import VARCHAR


class Customer(db.Model):
    __tablename__ = "customer"
    __table_args__ = {"schema": "rental"}

    customer_id = db.Column(
        db.Integer,
        primary_key=True,
        server_default=db.text("nextval('customer_customer_id_seq'::regclass)"),
    )
    store_id = db.Column(
        db.ForeignKey("store.store_id", ondelete="RESTRICT", onupdate="CASCADE"),
        nullable=False,
        index=True,
    )
    first_name = db.Column(VARCHAR(45), nullable=False)
    last_name = db.Column(VARCHAR(45), nullable=False, index=True)
    email = db.Column(VARCHAR(50))
    address_id = db.Column(
        db.ForeignKey("address.address_id", ondelete="RESTRICT", onupdate="CASCADE"),
        nullable=False,
        index=True,
    )
    activebool = db.Column(db.Boolean, nullable=False, server_default=db.text("true"))
    create_date = db.Column(
        db.Date, nullable=False, server_default=db.text("('now'::text)::date")
    )
    last_update = db.Column(db.DateTime, server_default=db.text("now()"))
    active = db.Column(db.Integer)

    address = db.relationship("Address")
    store = db.relationship("Store")

    def __repr__(self):
        return f"Customer('{self.first_name}', '{self.last_name}', '{self.email}', '{self.address_id}')"
