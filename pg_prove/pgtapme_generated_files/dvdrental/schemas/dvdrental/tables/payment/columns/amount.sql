BEGIN;
  SELECT plan(8);

  SELECT has_schema('dvdrental', 'Schema dvdrental should exist.');

  SELECT has_table('dvdrental', 'payment', 'Table dvdrental.payment should exist.');

  SELECT has_column('dvdrental', 'payment', 'amount', 'Column dvdrental.payment.amount should exist.');

  SELECT has_schema('pg_catalog', 'Schema pg_catalog should exist.');

  SELECT has_type('pg_catalog', 'numeric', 'Data type pg_catalog.numeric should exist.');

  SELECT col_not_null('dvdrental', 'payment', 'amount', 'Column dvdrental.payment.amount should be NOT NULL.');

  SELECT col_hasnt_default('dvdrental', 'payment', 'amount', 'Column dvdrental.payment.amount should not have DEFAULT.');

  SELECT col_type_is('dvdrental', 'payment', 'amount', 'pg_catalog', 'numeric(5,2)', 'Column dvdrental.payment.amount should have the correct type.');

  SELECT * FROM finish();
ROLLBACK;
