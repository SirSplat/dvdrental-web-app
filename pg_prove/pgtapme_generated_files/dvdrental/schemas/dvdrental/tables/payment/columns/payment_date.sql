BEGIN;
  SELECT plan(8);

  SELECT has_schema('dvdrental', 'Schema dvdrental should exist.');

  SELECT has_table('dvdrental', 'payment', 'Table dvdrental.payment should exist.');

  SELECT has_column('dvdrental', 'payment', 'payment_date', 'Column dvdrental.payment.payment_date should exist.');

  SELECT has_schema('pg_catalog', 'Schema pg_catalog should exist.');

  SELECT has_type('pg_catalog', 'timestamp', 'Data type pg_catalog.timestamp should exist.');

  SELECT col_not_null('dvdrental', 'payment', 'payment_date', 'Column dvdrental.payment.payment_date should be NOT NULL.');

  SELECT col_hasnt_default('dvdrental', 'payment', 'payment_date', 'Column dvdrental.payment.payment_date should not have DEFAULT.');

  SELECT col_type_is('dvdrental', 'payment', 'payment_date', 'pg_catalog', 'timestamp without time zone', 'Column dvdrental.payment.payment_date should have the correct type.');

  SELECT * FROM finish();
ROLLBACK;
