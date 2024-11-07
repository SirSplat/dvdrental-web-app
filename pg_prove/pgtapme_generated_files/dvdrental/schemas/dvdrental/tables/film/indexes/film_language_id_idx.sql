BEGIN;
  SELECT plan(6);

  SELECT has_schema('dvdrental', 'Schema dvdrental should exist.');

  SELECT has_table('dvdrental', 'film', 'Table dvdrental.film should exist.');

  SELECT has_column('dvdrental', 'film', 'language_id', 'Column dvdrental.film.language_id should exist.');

  SELECT has_role('dbo', 'Role dbo should exist.');

  SELECT index_owner_is('dvdrental', 'film', 'film_language_id_idx', 'dbo', 'Index dvdrental.film.film_language_id_idx should have the correct owner.');

  SELECT index_is_type('dvdrental', 'film', 'film_language_id_idx', 'btree', 'Index dvdrental.film.film_language_id_idx should be of the correct type.');

  SELECT * FROM finish();
ROLLBACK;
