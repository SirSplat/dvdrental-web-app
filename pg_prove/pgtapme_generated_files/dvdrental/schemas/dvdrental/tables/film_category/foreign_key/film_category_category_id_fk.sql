BEGIN;
  SELECT plan(7);

  SELECT has_schema('dvdrental', 'Schema dvdrental should exist.');

  SELECT has_table('dvdrental', 'film_category', 'Table dvdrental.film_category should exist.');

  SELECT has_column('dvdrental', 'film_category', 'category_id', 'Column dvdrental.film_category.category_id should exist.');

  SELECT has_schema('dvdrental', 'Schema dvdrental should exist.');

  SELECT has_table('dvdrental', 'category', 'Table dvdrental.category should exist.');

  SELECT has_column('dvdrental', 'category', 'category_id', 'Column dvdrental.category.category_id should exist.');

  SELECT fk_ok('dvdrental', 'film_category', ARRAY['category_id']::TEXT[], 'dvdrental', 'category', ARRAY['category_id']::TEXT[], 'Foreign key dvdrental.film_category.film_category_category_id_fk should exist.');

  SELECT * FROM finish();
ROLLBACK;
