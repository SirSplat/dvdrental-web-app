BEGIN;
  SELECT plan(8);

  SELECT has_schema('dvdrental', 'Schema dvdrental should exist.');

  SELECT has_table('dvdrental', 'customer', 'Table dvdrental.customer should exist.');

  SELECT has_column('dvdrental', 'customer', 'active', 'Column dvdrental.customer.active should exist.');

  SELECT has_schema('pg_catalog', 'Schema pg_catalog should exist.');

  SELECT has_type('pg_catalog', 'int4', 'Data type pg_catalog.int4 should exist.');

  SELECT col_is_null('dvdrental', 'customer', 'active', 'Column dvdrental.customer.active should not be NOT NULL.');

  SELECT col_hasnt_default('dvdrental', 'customer', 'active', 'Column dvdrental.customer.active should not have DEFAULT.');

  SELECT col_type_is('dvdrental', 'customer', 'active', 'pg_catalog', 'integer', 'Column dvdrental.customer.active should have the correct type.');

  SELECT * FROM finish();
ROLLBACK;
