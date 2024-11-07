BEGIN;
  SELECT plan(7);

  SELECT has_schema('dvdrental', 'Schema dvdrental should exist.');

  SELECT has_table('dvdrental', 'dvdrental', 'Table dvdrental.rental should exist.');

  SELECT has_column('dvdrental', 'dvdrental', 'customer_id', 'Column dvdrental.rental.customer_id should exist.');

  SELECT has_schema('dvdrental', 'Schema dvdrental should exist.');

  SELECT has_table('dvdrental', 'customer', 'Table dvdrental.customer should exist.');

  SELECT has_column('dvdrental', 'customer', 'customer_id', 'Column dvdrental.customer.customer_id should exist.');

  SELECT fk_ok('dvdrental', 'dvdrental', ARRAY['customer_id']::TEXT[], 'dvdrental', 'customer', ARRAY['customer_id']::TEXT[], 'Foreign key dvdrental.rental.rental_customer_id_fk should exist.');

  SELECT * FROM finish();
ROLLBACK;
