BEGIN;
  SELECT plan(6);

  SELECT has_schema('dvdrental', 'Schema dvdrental should exist.');

  SELECT has_table('dvdrental', 'film', 'Table dvdrental.film should exist.');

  SELECT has_column('dvdrental', 'film', 'title', 'Column dvdrental.film.title should exist.');

  SELECT has_role('dbo', 'Role dbo should exist.');

  SELECT index_owner_is('dvdrental', 'film', 'film_title_idx', 'dbo', 'Index dvdrental.film.film_title_idx should have the correct owner.');

  SELECT index_is_type('dvdrental', 'film', 'film_title_idx', 'btree', 'Index dvdrental.film.film_title_idx should be of the correct type.');

  SELECT * FROM finish();
ROLLBACK;
