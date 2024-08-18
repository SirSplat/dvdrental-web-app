from app import db


class Store(db.Model):
    __tablename__ = "store"
    __table_args__ = {"schema": "rental"}

    store_id = db.Column(
        db.Integer,
        primary_key=True,
        server_default=db.text("nextval('store_store_id_seq'::regclass)"),
    )
    manager_staff_id = db.Column(
        db.ForeignKey("staff.staff_id", ondelete="RESTRICT", onupdate="CASCADE"),
        nullable=False,
        unique=True,
    )
    address_id = db.Column(
        db.ForeignKey("address.address_id", ondelete="RESTRICT", onupdate="CASCADE"),
        nullable=False,
    )
    last_update = db.Column(
        db.DateTime, nullable=False, server_default=db.text("now()")
    )

    address = db.relationship("Address")
    staff = db.relationship("Staff")

    def __repr__(self):
        return (
            f"Store('{self.store_id}', '{self.manager_staff_id}', '{self.address_id}')"
        )
