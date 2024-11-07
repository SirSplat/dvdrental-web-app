BEGIN;
  SELECT plan(8);

  SELECT has_schema('dvdrental', 'Schema dvdrental should exist.');

  SELECT has_table('dvdrental', 'film', 'Table dvdrental.film should exist.');

  SELECT has_column('dvdrental', 'film', 'film_id', 'Column dvdrental.film.film_id should exist.');

  SELECT has_role('dbo', 'Role dbo should exist.');

  SELECT index_owner_is('dvdrental', 'film', 'film_pk', 'dbo', 'Index dvdrental.film.film_pk should have the correct owner.');

  SELECT index_is_primary('dvdrental', 'film', 'film_pk', 'Index dvdrental.film.film_pk should be a primary key index.');

  SELECT index_is_unique('dvdrental', 'film', 'film_pk', 'Index dvdrental.film.film_pk should be a unique index.');

  SELECT index_is_type('dvdrental', 'film', 'film_pk', 'btree', 'Index dvdrental.film.film_pk should be of the correct type.');

  SELECT * FROM finish();
ROLLBACK;
