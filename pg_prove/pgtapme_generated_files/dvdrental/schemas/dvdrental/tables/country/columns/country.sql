BEGIN;
  SELECT plan(8);

  SELECT has_schema('dvdrental', 'Schema dvdrental should exist.');

  SELECT has_table('dvdrental', 'country', 'Table dvdrental.country should exist.');

  SELECT has_column('dvdrental', 'country', 'country', 'Column dvdrental.country.country should exist.');

  SELECT has_schema('pg_catalog', 'Schema pg_catalog should exist.');

  SELECT has_type('pg_catalog', 'varchar', 'Data type pg_catalog.varchar should exist.');

  SELECT col_not_null('dvdrental', 'country', 'country', 'Column dvdrental.country.country should be NOT NULL.');

  SELECT col_hasnt_default('dvdrental', 'country', 'country', 'Column dvdrental.country.country should not have DEFAULT.');

  SELECT col_type_is('dvdrental', 'country', 'country', 'pg_catalog', 'character varying(50)', 'Column dvdrental.country.country should have the correct type.');

  SELECT * FROM finish();
ROLLBACK;
