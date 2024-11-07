BEGIN;
  SELECT plan(9);

  SELECT has_schema('dvdrental', 'Schema dvdrental should exist.');

  SELECT has_table('dvdrental', 'customer', 'Table dvdrental.customer should exist.');

  SELECT has_column('dvdrental', 'customer', 'create_date', 'Column dvdrental.customer.create_date should exist.');

  SELECT has_schema('pg_catalog', 'Schema pg_catalog should exist.');

  SELECT has_type('pg_catalog', 'date', 'Data type pg_catalog.date should exist.');

  SELECT col_not_null('dvdrental', 'customer', 'create_date', 'Column dvdrental.customer.create_date should be NOT NULL.');

  SELECT col_has_default('dvdrental', 'customer', 'create_date', 'Column dvdrental.customer.create_date should have DEFAULT.');

  SELECT col_default_is('dvdrental', 'customer', 'create_date', $$('now'::text)::date$$, 'Column dvdrental.customer.create_date should have the correct default.');

  SELECT col_type_is('dvdrental', 'customer', 'create_date', 'pg_catalog', 'date', 'Column dvdrental.customer.create_date should have the correct type.');

  SELECT * FROM finish();
ROLLBACK;
