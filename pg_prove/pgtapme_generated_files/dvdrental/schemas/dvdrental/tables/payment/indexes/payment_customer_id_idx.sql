BEGIN;
  SELECT plan(6);

  SELECT has_schema('dvdrental', 'Schema dvdrental should exist.');

  SELECT has_table('dvdrental', 'payment', 'Table dvdrental.payment should exist.');

  SELECT has_column('dvdrental', 'payment', 'customer_id', 'Column dvdrental.payment.customer_id should exist.');

  SELECT has_role('dbo', 'Role dbo should exist.');

  SELECT index_owner_is('dvdrental', 'payment', 'payment_customer_id_idx', 'dbo', 'Index dvdrental.payment.payment_customer_id_idx should have the correct owner.');

  SELECT index_is_type('dvdrental', 'payment', 'payment_customer_id_idx', 'btree', 'Index dvdrental.payment.payment_customer_id_idx should be of the correct type.');

  SELECT * FROM finish();
ROLLBACK;
