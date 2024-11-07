BEGIN;
  SELECT plan(9);

  SELECT has_schema('dvdrental', 'Schema dvdrental should exist.');

  SELECT has_table('dvdrental', 'customer', 'Table dvdrental.customer should exist.');

  SELECT has_column('dvdrental', 'customer', 'activebool', 'Column dvdrental.customer.activebool should exist.');

  SELECT has_schema('pg_catalog', 'Schema pg_catalog should exist.');

  SELECT has_type('pg_catalog', 'bool', 'Data type pg_catalog.bool should exist.');

  SELECT col_not_null('dvdrental', 'customer', 'activebool', 'Column dvdrental.customer.activebool should be NOT NULL.');

  SELECT col_has_default('dvdrental', 'customer', 'activebool', 'Column dvdrental.customer.activebool should have DEFAULT.');

  SELECT col_default_is('dvdrental', 'customer', 'activebool', 'true', 'Column dvdrental.customer.activebool should have the correct default.');

  SELECT col_type_is('dvdrental', 'customer', 'activebool', 'pg_catalog', 'boolean', 'Column dvdrental.customer.activebool should have the correct type.');

  SELECT * FROM finish();
ROLLBACK;
