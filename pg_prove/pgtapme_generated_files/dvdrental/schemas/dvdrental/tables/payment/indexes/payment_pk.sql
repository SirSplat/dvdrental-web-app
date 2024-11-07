BEGIN;
  SELECT plan(8);

  SELECT has_schema('dvdrental', 'Schema dvdrental should exist.');

  SELECT has_table('dvdrental', 'payment', 'Table dvdrental.payment should exist.');

  SELECT has_column('dvdrental', 'payment', 'payment_id', 'Column dvdrental.payment.payment_id should exist.');

  SELECT has_role('dbo', 'Role dbo should exist.');

  SELECT index_owner_is('dvdrental', 'payment', 'payment_pk', 'dbo', 'Index dvdrental.payment.payment_pk should have the correct owner.');

  SELECT index_is_primary('dvdrental', 'payment', 'payment_pk', 'Index dvdrental.payment.payment_pk should be a primary key index.');

  SELECT index_is_unique('dvdrental', 'payment', 'payment_pk', 'Index dvdrental.payment.payment_pk should be a unique index.');

  SELECT index_is_type('dvdrental', 'payment', 'payment_pk', 'btree', 'Index dvdrental.payment.payment_pk should be of the correct type.');

  SELECT * FROM finish();
ROLLBACK;
