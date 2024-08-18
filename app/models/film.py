from app import db
from app.pg_types import MPAA_RATING, VARCHAR, TSVECTOR


class Film(db.Model):
    __tablename__ = "film"
    __table_args__ = {"schema": "rental"}

    film_id = db.Column(
        db.Integer,
        primary_key=True,
        server_default=db.text("nextval('film_film_id_seq'::regclass)"),
    )
    title = db.Column(VARCHAR(255), nullable=False, index=True)
    description = db.Column(db.Text)
    release_year = db.Column(db.Integer)
    language_id = db.Column(
        db.ForeignKey("language.language_id", ondelete="RESTRICT", onupdate="CASCADE"),
        nullable=False,
        index=True,
    )
    rental_duration = db.Column(
        db.SmallInteger, nullable=False, server_default=db.text("3")
    )
    rental_rate = db.Column(
        db.Numeric(4, 2), nullable=False, server_default=db.text("4.99")
    )
    length = db.Column(db.SmallInteger)
    replacement_cost = db.Column(
        db.Numeric(5, 2), nullable=False, server_default=db.text("19.99")
    )
    rating = db.Column(
        MPAA_RATING,
        server_default=db.text("'G'::mpaa_rating"),
    )
    last_update = db.Column(
        db.DateTime, nullable=False, server_default=db.text("now()")
    )
    special_features = db.Column(db.ARRAY(db.Text()))
    fulltext = db.Column(TSVECTOR, nullable=False, index=True)

    language = db.relationship("Language")

    def __repr__(self):
        return f"Film('{self.title}', '{self.description}', '{self.release_year}', '{self.rating}', '{self.rental_rate}', '{self.replacement_cost}', '{self.length}', '{self.special_features}')"
