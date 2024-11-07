BEGIN;
  SELECT plan(9);

  SELECT has_schema('dvdrental', 'Schema dvdrental should exist.');

  SELECT has_table('dvdrental', 'customer', 'Table dvdrental.customer should exist.');

  SELECT has_column('dvdrental', 'customer', 'last_update', 'Column dvdrental.customer.last_update should exist.');

  SELECT has_schema('pg_catalog', 'Schema pg_catalog should exist.');

  SELECT has_type('pg_catalog', 'timestamp', 'Data type pg_catalog.timestamp should exist.');

  SELECT col_is_null('dvdrental', 'customer', 'last_update', 'Column dvdrental.customer.last_update should not be NOT NULL.');

  SELECT col_has_default('dvdrental', 'customer', 'last_update', 'Column dvdrental.customer.last_update should have DEFAULT.');

  SELECT col_default_is('dvdrental', 'customer', 'last_update', 'now()', 'Column dvdrental.customer.last_update should have the correct default.');

  SELECT col_type_is('dvdrental', 'customer', 'last_update', 'pg_catalog', 'timestamp without time zone', 'Column dvdrental.customer.last_update should have the correct type.');

  SELECT * FROM finish();
ROLLBACK;
