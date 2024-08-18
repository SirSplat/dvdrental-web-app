from app import db


class Film_category(db.Model):
    __tablename__ = "film_category"
    __table_args__ = {"schema": "rental"}

    film_id = db.Column(
        db.ForeignKey("film.film_id", ondelete="RESTRICT", onupdate="CASCADE"),
        primary_key=True,
        nullable=False,
    )
    category_id = db.Column(
        db.ForeignKey("category.category_id", ondelete="RESTRICT", onupdate="CASCADE"),
        primary_key=True,
        nullable=False,
    )
    last_update = db.Column(
        db.DateTime, nullable=False, server_default=db.text("now()")
    )

    category = db.relationship("Category")
    film = db.relationship("Film")

    def __repr__(self):
        return f"Film_category('{self.film_id}', '{self.category_id}')"