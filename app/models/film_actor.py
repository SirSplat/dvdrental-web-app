from app import db


class Film_actor(db.Model):
    __tablename__ = "film_actor"
    __table_args__ = {"schema": "rental"}

    actor_id = db.Column(
        db.ForeignKey("actor.actor_id", ondelete="RESTRICT", onupdate="CASCADE"),
        primary_key=True,
        nullable=False,
    )
    film_id = db.Column(
        db.ForeignKey("film.film_id", ondelete="RESTRICT", onupdate="CASCADE"),
        primary_key=True,
        nullable=False,
        index=True,
    )
    last_update = db.Column(
        db.DateTime, nullable=False, server_default=db.text("now()")
    )

    actor = db.relationship("Actor")
    film = db.relationship("Film")

    def __repr__(self):
        return f"Film_actor('{self.actor_id}', '{self.film_id}')"