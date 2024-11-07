BEGIN;
  SELECT plan(8);

  SELECT has_schema('dvdrental', 'Schema dvdrental should exist.');

  SELECT has_table('dvdrental', 'film', 'Table dvdrental.film should exist.');

  SELECT has_column('dvdrental', 'film', 'description', 'Column dvdrental.film.description should exist.');

  SELECT has_schema('pg_catalog', 'Schema pg_catalog should exist.');

  SELECT has_type('pg_catalog', 'text', 'Data type pg_catalog.text should exist.');

  SELECT col_is_null('dvdrental', 'film', 'description', 'Column dvdrental.film.description should not be NOT NULL.');

  SELECT col_hasnt_default('dvdrental', 'film', 'description', 'Column dvdrental.film.description should not have DEFAULT.');

  SELECT col_type_is('dvdrental', 'film', 'description', 'pg_catalog', 'text', 'Column dvdrental.film.description should have the correct type.');

  SELECT * FROM finish();
ROLLBACK;
