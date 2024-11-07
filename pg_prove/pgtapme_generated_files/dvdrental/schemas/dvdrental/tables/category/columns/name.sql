BEGIN;
  SELECT plan(8);

  SELECT has_schema('dvdrental', 'Schema dvdrental should exist.');

  SELECT has_table('dvdrental', 'category', 'Table dvdrental.category should exist.');

  SELECT has_column('dvdrental', 'category', 'name', 'Column dvdrental.category.name should exist.');

  SELECT has_schema('pg_catalog', 'Schema pg_catalog should exist.');

  SELECT has_type('pg_catalog', 'varchar', 'Data type pg_catalog.varchar should exist.');

  SELECT col_not_null('dvdrental', 'category', 'name', 'Column dvdrental.category.name should be NOT NULL.');

  SELECT col_hasnt_default('dvdrental', 'category', 'name', 'Column dvdrental.category.name should not have DEFAULT.');

  SELECT col_type_is('dvdrental', 'category', 'name', 'pg_catalog', 'character varying(25)', 'Column dvdrental.category.name should have the correct type.');

  SELECT * FROM finish();
ROLLBACK;
