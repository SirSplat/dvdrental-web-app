BEGIN;
  SELECT plan(7);

  SELECT has_schema('dvdrental', 'Schema dvdrental should exist.');

  SELECT has_table('dvdrental', 'payment', 'Table dvdrental.payment should exist.');

  SELECT has_column('dvdrental', 'payment', 'customer_id', 'Column dvdrental.payment.customer_id should exist.');

  SELECT has_schema('dvdrental', 'Schema dvdrental should exist.');

  SELECT has_table('dvdrental', 'customer', 'Table dvdrental.customer should exist.');

  SELECT has_column('dvdrental', 'customer', 'customer_id', 'Column dvdrental.customer.customer_id should exist.');

  SELECT fk_ok('dvdrental', 'payment', ARRAY['customer_id']::TEXT[], 'dvdrental', 'customer', ARRAY['customer_id']::TEXT[], 'Foreign key dvdrental.payment.payment_customer_id_fk should exist.');

  SELECT * FROM finish();
ROLLBACK;
