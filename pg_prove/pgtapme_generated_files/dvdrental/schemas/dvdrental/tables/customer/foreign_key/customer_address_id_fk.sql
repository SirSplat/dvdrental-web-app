BEGIN;
  SELECT plan(7);

  SELECT has_schema('dvdrental', 'Schema dvdrental should exist.');

  SELECT has_table('dvdrental', 'customer', 'Table dvdrental.customer should exist.');

  SELECT has_column('dvdrental', 'customer', 'address_id', 'Column dvdrental.customer.address_id should exist.');

  SELECT has_schema('dvdrental', 'Schema dvdrental should exist.');

  SELECT has_table('dvdrental', 'address', 'Table dvdrental.address should exist.');

  SELECT has_column('dvdrental', 'address', 'address_id', 'Column dvdrental.address.address_id should exist.');

  SELECT fk_ok('dvdrental', 'customer', ARRAY['address_id']::TEXT[], 'dvdrental', 'address', ARRAY['address_id']::TEXT[], 'Foreign key dvdrental.customer.customer_address_id_fk should exist.');

  SELECT * FROM finish();
ROLLBACK;
