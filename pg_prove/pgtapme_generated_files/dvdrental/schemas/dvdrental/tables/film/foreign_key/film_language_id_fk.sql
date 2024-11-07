BEGIN;
  SELECT plan(7);

  SELECT has_schema('dvdrental', 'Schema dvdrental should exist.');

  SELECT has_table('dvdrental', 'film', 'Table dvdrental.film should exist.');

  SELECT has_column('dvdrental', 'film', 'language_id', 'Column dvdrental.film.language_id should exist.');

  SELECT has_schema('dvdrental', 'Schema dvdrental should exist.');

  SELECT has_table('dvdrental', 'language', 'Table dvdrental.language should exist.');

  SELECT has_column('dvdrental', 'language', 'language_id', 'Column dvdrental.language.language_id should exist.');

  SELECT fk_ok('dvdrental', 'film', ARRAY['language_id']::TEXT[], 'dvdrental', 'language', ARRAY['language_id']::TEXT[], 'Foreign key dvdrental.film.film_language_id_fk should exist.');

  SELECT * FROM finish();
ROLLBACK;
