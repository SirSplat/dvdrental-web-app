BEGIN;
  SELECT plan(8);

  SELECT has_schema('dvdrental', 'Schema dvdrental should exist.');

  SELECT has_table('dvdrental', 'customer', 'Table dvdrental.customer should exist.');

  SELECT has_column('dvdrental', 'customer', 'email', 'Column dvdrental.customer.email should exist.');

  SELECT has_schema('pg_catalog', 'Schema pg_catalog should exist.');

  SELECT has_type('pg_catalog', 'varchar', 'Data type pg_catalog.varchar should exist.');

  SELECT col_is_null('dvdrental', 'customer', 'email', 'Column dvdrental.customer.email should not be NOT NULL.');

  SELECT col_hasnt_default('dvdrental', 'customer', 'email', 'Column dvdrental.customer.email should not have DEFAULT.');

  SELECT col_type_is('dvdrental', 'customer', 'email', 'pg_catalog', 'character varying(50)', 'Column dvdrental.customer.email should have the correct type.');

  SELECT * FROM finish();
ROLLBACK;
