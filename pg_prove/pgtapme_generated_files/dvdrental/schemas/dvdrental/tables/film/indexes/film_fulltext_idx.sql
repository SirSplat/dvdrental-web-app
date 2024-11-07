BEGIN;
  SELECT plan(6);

  SELECT has_schema('dvdrental', 'Schema dvdrental should exist.');

  SELECT has_table('dvdrental', 'film', 'Table dvdrental.film should exist.');

  SELECT has_column('dvdrental', 'film', 'fulltext', 'Column dvdrental.film.fulltext should exist.');

  SELECT has_role('dbo', 'Role dbo should exist.');

  SELECT index_owner_is('dvdrental', 'film', 'film_fulltext_idx', 'dbo', 'Index dvdrental.film.film_fulltext_idx should have the correct owner.');

  SELECT index_is_type('dvdrental', 'film', 'film_fulltext_idx', 'gist', 'Index dvdrental.film.film_fulltext_idx should be of the correct type.');

  SELECT * FROM finish();
ROLLBACK;
