from app import db
from app.pg_types import VARCHAR


class City(db.Model):
    __tablename__ = "city"
    __table_args__ = {"schema": "rental"}

    city_id = db.Column(
        db.Integer,
        primary_key=True,
        server_default=db.text("nextval('city_city_id_seq'::regclass)"),
    )
    city = db.Column(VARCHAR(50), nullable=False)
    country_id = db.Column(
        db.ForeignKey("country.country_id"), nullable=False, index=True
    )
    last_update = db.Column(
        db.DateTime, nullable=False, server_default=db.text("now()")
    )

    country = db.relationship("Country")

    def __repr__(self):
        return f"City('{self.city}')"
