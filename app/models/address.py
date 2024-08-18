from app import db
from app.pg_types import VARCHAR


class Address(db.Model):
    __tablename__ = "address"
    __table_args__ = {"schema": "rental"}

    address_id = db.Column(
        db.Integer,
        primary_key=True,
        server_default=db.text("nextval('address_address_id_seq'::regclass)"),
    )
    address = db.Column(VARCHAR(50), nullable=False)
    address2 = db.Column(VARCHAR(50))
    district = db.Column(VARCHAR(20), nullable=False)
    city_id = db.Column(db.ForeignKey("city.city_id"), nullable=False, index=True)
    postal_code = db.Column(VARCHAR(10))
    phone = db.Column(VARCHAR(20), nullable=False)
    last_update = db.Column(
        db.DateTime, nullable=False, server_default=db.text("now()")
    )

    city = db.relationship("City")

    def __repr__(self):
        return f"Address('{self.address}', '{self.address2}', '{self.district}', '{self.postal_code}', '{self.phone}')"
