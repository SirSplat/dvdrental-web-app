BEGIN;
  SELECT plan(8);

  SELECT has_schema('dvdrental', 'Schema dvdrental should exist.');

  SELECT has_table('dvdrental', 'city', 'Table dvdrental.city should exist.');

  SELECT has_column('dvdrental', 'city', 'city', 'Column dvdrental.city.city should exist.');

  SELECT has_schema('pg_catalog', 'Schema pg_catalog should exist.');

  SELECT has_type('pg_catalog', 'varchar', 'Data type pg_catalog.varchar should exist.');

  SELECT col_not_null('dvdrental', 'city', 'city', 'Column dvdrental.city.city should be NOT NULL.');

  SELECT col_hasnt_default('dvdrental', 'city', 'city', 'Column dvdrental.city.city should not have DEFAULT.');

  SELECT col_type_is('dvdrental', 'city', 'city', 'pg_catalog', 'character varying(50)', 'Column dvdrental.city.city should have the correct type.');

  SELECT * FROM finish();
ROLLBACK;
