from app import db


class Payment(db.Model):
    __tablename__ = "payment"
    __table_args__ = {"schema": "rental"}

    payment_id = db.Column(
        db.Integer,
        primary_key=True,
        server_default=db.text("nextval('payment_payment_id_seq'::regclass)"),
    )
    customer_id = db.Column(
        db.ForeignKey("customer.customer_id", ondelete="RESTRICT", onupdate="CASCADE"),
        nullable=False,
        index=True,
    )
    staff_id = db.Column(
        db.ForeignKey("staff.staff_id", ondelete="RESTRICT", onupdate="CASCADE"),
        nullable=False,
        index=True,
    )
    rental_id = db.Column(
        db.ForeignKey("rental.rental_id", ondelete="SET NULL", onupdate="CASCADE"),
        nullable=False,
        index=True,
    )
    amount = db.Column(db.Numeric(5, 2), nullable=False)
    payment_date = db.Column(db.DateTime, nullable=False)

    customer = db.relationship("Customer")
    rental = db.relationship("Rental")
    staff = db.relationship("Staff")

    def __repr__(self):
        return f"Payment('{self.customer_id}', '{self.staff_id}', '{self.rental_id}', '{self.amount}', '{self.payment_date}')"
