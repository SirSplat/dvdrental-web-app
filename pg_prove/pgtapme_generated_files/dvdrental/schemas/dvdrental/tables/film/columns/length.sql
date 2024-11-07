BEGIN;
  SELECT plan(8);

  SELECT has_schema('dvdrental', 'Schema dvdrental should exist.');

  SELECT has_table('dvdrental', 'film', 'Table dvdrental.film should exist.');

  SELECT has_column('dvdrental', 'film', 'length', 'Column dvdrental.film.length should exist.');

  SELECT has_schema('pg_catalog', 'Schema pg_catalog should exist.');

  SELECT has_type('pg_catalog', 'int2', 'Data type pg_catalog.int2 should exist.');

  SELECT col_is_null('dvdrental', 'film', 'length', 'Column dvdrental.film.length should not be NOT NULL.');

  SELECT col_hasnt_default('dvdrental', 'film', 'length', 'Column dvdrental.film.length should not have DEFAULT.');

  SELECT col_type_is('dvdrental', 'film', 'length', 'pg_catalog', 'smallint', 'Column dvdrental.film.length should have the correct type.');

  SELECT * FROM finish();
ROLLBACK;
