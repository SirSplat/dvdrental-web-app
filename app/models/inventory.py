from app import db



class Inventory(db.Model):
    __tablename__ = "inventory"
    __table_args__ = {"schema": "rental"}

    inventory_id = db.Column(
        db.Integer,
        primary_key=True,
        server_default=db.text("nextval('inventory_inventory_id_seq'::regclass)"),
    )
    film_id = db.Column(
        db.ForeignKey("film.film_id", ondelete="RESTRICT", onupdate="CASCADE"),
        nullable=False,
    )
    store_id = db.Column(
        db.ForeignKey("store.store_id", ondelete="RESTRICT", onupdate="CASCADE"),
        nullable=False,
    )
    last_update = db.Column(
        db.DateTime, nullable=False, server_default=db.text("now()")
    )

    film = db.relationship("Film")
    store = db.relationship("Store")

    def __repr__(self):
        return f"Inventory('{self.inventory_id}', '{self.film_id}', '{self.store_id}')"