BEGIN;
  SELECT plan(8);

  SELECT has_schema('dvdrental', 'Schema dvdrental should exist.');

  SELECT has_table('dvdrental', 'payment', 'Table dvdrental.payment should exist.');

  SELECT has_column('dvdrental', 'payment', 'rental_id', 'Column dvdrental.payment.rental_id should exist.');

  SELECT has_schema('pg_catalog', 'Schema pg_catalog should exist.');

  SELECT has_type('pg_catalog', 'int4', 'Data type pg_catalog.int4 should exist.');

  SELECT col_not_null('dvdrental', 'payment', 'rental_id', 'Column dvdrental.payment.rental_id should be NOT NULL.');

  SELECT col_hasnt_default('dvdrental', 'payment', 'rental_id', 'Column dvdrental.payment.rental_id should not have DEFAULT.');

  SELECT col_type_is('dvdrental', 'payment', 'rental_id', 'pg_catalog', 'integer', 'Column dvdrental.payment.rental_id should have the correct type.');

  SELECT * FROM finish();
ROLLBACK;
