BEGIN;
  SELECT plan(7);

  SELECT has_schema('dvdrental', 'Schema dvdrental should exist.');

  SELECT has_table('dvdrental', 'film_actor', 'Table dvdrental.film_actor should exist.');

  SELECT has_column('dvdrental', 'film_actor', 'film_id', 'Column dvdrental.film_actor.film_id should exist.');

  SELECT has_schema('dvdrental', 'Schema dvdrental should exist.');

  SELECT has_table('dvdrental', 'film', 'Table dvdrental.film should exist.');

  SELECT has_column('dvdrental', 'film', 'film_id', 'Column dvdrental.film.film_id should exist.');

  SELECT fk_ok('dvdrental', 'film_actor', ARRAY['film_id']::TEXT[], 'dvdrental', 'film', ARRAY['film_id']::TEXT[], 'Foreign key dvdrental.film_actor.film_actor_film_id_fk should exist.');

  SELECT * FROM finish();
ROLLBACK;
