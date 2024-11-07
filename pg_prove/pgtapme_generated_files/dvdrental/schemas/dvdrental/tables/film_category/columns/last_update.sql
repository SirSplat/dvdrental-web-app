BEGIN;
  SELECT plan(9);

  SELECT has_schema('dvdrental', 'Schema dvdrental should exist.');

  SELECT has_table('dvdrental', 'film_category', 'Table dvdrental.film_category should exist.');

  SELECT has_column('dvdrental', 'film_category', 'last_update', 'Column dvdrental.film_category.last_update should exist.');

  SELECT has_schema('pg_catalog', 'Schema pg_catalog should exist.');

  SELECT has_type('pg_catalog', 'timestamp', 'Data type pg_catalog.timestamp should exist.');

  SELECT col_not_null('dvdrental', 'film_category', 'last_update', 'Column dvdrental.film_category.last_update should be NOT NULL.');

  SELECT col_has_default('dvdrental', 'film_category', 'last_update', 'Column dvdrental.film_category.last_update should have DEFAULT.');

  SELECT col_default_is('dvdrental', 'film_category', 'last_update', 'now()', 'Column dvdrental.film_category.last_update should have the correct default.');

  SELECT col_type_is('dvdrental', 'film_category', 'last_update', 'pg_catalog', 'timestamp without time zone', 'Column dvdrental.film_category.last_update should have the correct type.');

  SELECT * FROM finish();
ROLLBACK;
