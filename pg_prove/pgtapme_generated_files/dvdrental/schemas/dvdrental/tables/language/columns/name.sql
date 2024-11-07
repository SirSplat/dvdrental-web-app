BEGIN;
  SELECT plan(8);

  SELECT has_schema('dvdrental', 'Schema dvdrental should exist.');

  SELECT has_table('dvdrental', 'language', 'Table dvdrental.language should exist.');

  SELECT has_column('dvdrental', 'language', 'name', 'Column dvdrental.language.name should exist.');

  SELECT has_schema('pg_catalog', 'Schema pg_catalog should exist.');

  SELECT has_type('pg_catalog', 'bpchar', 'Data type pg_catalog.bpchar should exist.');

  SELECT col_not_null('dvdrental', 'language', 'name', 'Column dvdrental.language.name should be NOT NULL.');

  SELECT col_hasnt_default('dvdrental', 'language', 'name', 'Column dvdrental.language.name should not have DEFAULT.');

  SELECT col_type_is('dvdrental', 'language', 'name', 'pg_catalog', 'character(20)', 'Column dvdrental.language.name should have the correct type.');

  SELECT * FROM finish();
ROLLBACK;
