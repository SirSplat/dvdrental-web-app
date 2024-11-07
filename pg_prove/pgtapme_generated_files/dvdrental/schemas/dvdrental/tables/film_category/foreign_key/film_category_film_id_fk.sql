BEGIN;
  SELECT plan(7);

  SELECT has_schema('dvdrental', 'Schema dvdrental should exist.');

  SELECT has_table('dvdrental', 'film_category', 'Table dvdrental.film_category should exist.');

  SELECT has_column('dvdrental', 'film_category', 'film_id', 'Column dvdrental.film_category.film_id should exist.');

  SELECT has_schema('dvdrental', 'Schema dvdrental should exist.');

  SELECT has_table('dvdrental', 'film', 'Table dvdrental.film should exist.');

  SELECT has_column('dvdrental', 'film', 'film_id', 'Column dvdrental.film.film_id should exist.');

  SELECT fk_ok('dvdrental', 'film_category', ARRAY['film_id']::TEXT[], 'dvdrental', 'film', ARRAY['film_id']::TEXT[], 'Foreign key dvdrental.film_category.film_category_film_id_fk should exist.');

  SELECT * FROM finish();
ROLLBACK;
