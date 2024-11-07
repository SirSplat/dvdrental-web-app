BEGIN;
  SELECT plan(6);

  SELECT has_schema('dvdrental', 'Schema dvdrental should exist.');

  SELECT has_table('dvdrental', 'film_actor', 'Table dvdrental.film_actor should exist.');

  SELECT has_column('dvdrental', 'film_actor', 'film_id', 'Column dvdrental.film_actor.film_id should exist.');

  SELECT has_role('dbo', 'Role dbo should exist.');

  SELECT index_owner_is('dvdrental', 'film_actor', 'film_actor_film_id_idx', 'dbo', 'Index dvdrental.film_actor.film_actor_film_id_idx should have the correct owner.');

  SELECT index_is_type('dvdrental', 'film_actor', 'film_actor_film_id_idx', 'btree', 'Index dvdrental.film_actor.film_actor_film_id_idx should be of the correct type.');

  SELECT * FROM finish();
ROLLBACK;
