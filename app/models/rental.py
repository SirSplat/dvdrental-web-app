from app import db


class Rental(db.Model):
    __tablename__ = "rental"
    __table_args__ = (
        db.Index(
            "rental_rental_date_inventory_id_customer_id_uidx",
            "rental_date",
            "inventory_id",
            "customer_id",
            unique=True,
        ),
        {"schema": "rental"},
    )

    rental_id = db.Column(
        db.Integer,
        primary_key=True,
        server_default=db.text("nextval('rental_rental_id_seq'::regclass)"),
    )
    rental_date = db.Column(db.DateTime, nullable=False)
    inventory_id = db.Column(
        db.ForeignKey(
            "inventory.inventory_id", ondelete="RESTRICT", onupdate="CASCADE"
        ),
        nullable=False,
        index=True,
    )
    customer_id = db.Column(
        db.ForeignKey("customer.customer_id", ondelete="RESTRICT", onupdate="CASCADE"),
        nullable=False,
    )
    return_date = db.Column(db.DateTime)
    staff_id = db.Column(db.ForeignKey("staff.staff_id"), nullable=False)
    last_update = db.Column(
        db.DateTime, nullable=False, server_default=db.text("now()")
    )

    customer = db.relationship("Customer")
    inventory = db.relationship("Inventory")
    staff = db.relationship("Staff")

    def __repr__(self):
        return f"Rental('{self.rental_date}', '{self.inventory_id}', '{self.customer_id}', '{self.staff_id}')"