BEGIN;
  SELECT plan(6);

  SELECT has_schema('dvdrental', 'Schema dvdrental should exist.');

  SELECT has_table('dvdrental', 'customer', 'Table dvdrental.customer should exist.');

  SELECT has_column('dvdrental', 'customer', 'store_id', 'Column dvdrental.customer.store_id should exist.');

  SELECT has_role('dbo', 'Role dbo should exist.');

  SELECT index_owner_is('dvdrental', 'customer', 'customer_store_id_idx', 'dbo', 'Index dvdrental.customer.customer_store_id_idx should have the correct owner.');

  SELECT index_is_type('dvdrental', 'customer', 'customer_store_id_idx', 'btree', 'Index dvdrental.customer.customer_store_id_idx should be of the correct type.');

  SELECT * FROM finish();
ROLLBACK;
