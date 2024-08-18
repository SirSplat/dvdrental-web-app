from app import db
from sqlalchemy.dialects.postgresql import TEXT, SMALLINT


class Country(db.Model):
    __tablename__ = "country"
    __table_args__ = {"schema": "rental"}

    country_fk = db.Column(SMALLINT, primary_key=True, autoincrement=True)
    country_code = db.Column(SMALLINT, nullable=False, unique=True)
    iso2 = db.Column(TEXT, nullable=False)
    iso3 = db.Column(TEXT, nullable=False)
    country_name = db.Column(TEXT, nullable=False)

    def __repr__(self):
        return f"<Country(country_fk={self.country_fk}, country_code={self.country_code}, country_name='{self.country_name}')>"
