BEGIN;
  SELECT plan(7);

  SELECT has_schema('dvdrental', 'Schema dvdrental should exist.');

  SELECT has_table('dvdrental', 'film_actor', 'Table dvdrental.film_actor should exist.');

  SELECT has_column('dvdrental', 'film_actor', 'actor_id', 'Column dvdrental.film_actor.actor_id should exist.');

  SELECT has_schema('dvdrental', 'Schema dvdrental should exist.');

  SELECT has_table('dvdrental', 'actor', 'Table dvdrental.actor should exist.');

  SELECT has_column('dvdrental', 'actor', 'actor_id', 'Column dvdrental.actor.actor_id should exist.');

  SELECT fk_ok('dvdrental', 'film_actor', ARRAY['actor_id']::TEXT[], 'dvdrental', 'actor', ARRAY['actor_id']::TEXT[], 'Foreign key dvdrental.film_actor.film_actor_actor_id_fk should exist.');

  SELECT * FROM finish();
ROLLBACK;
