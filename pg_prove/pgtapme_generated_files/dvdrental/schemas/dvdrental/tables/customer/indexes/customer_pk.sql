BEGIN;
  SELECT plan(8);

  SELECT has_schema('dvdrental', 'Schema dvdrental should exist.');

  SELECT has_table('dvdrental', 'customer', 'Table dvdrental.customer should exist.');

  SELECT has_column('dvdrental', 'customer', 'customer_id', 'Column dvdrental.customer.customer_id should exist.');

  SELECT has_role('dbo', 'Role dbo should exist.');

  SELECT index_owner_is('dvdrental', 'customer', 'customer_pk', 'dbo', 'Index dvdrental.customer.customer_pk should have the correct owner.');

  SELECT index_is_primary('dvdrental', 'customer', 'customer_pk', 'Index dvdrental.customer.customer_pk should be a primary key index.');

  SELECT index_is_unique('dvdrental', 'customer', 'customer_pk', 'Index dvdrental.customer.customer_pk should be a unique index.');

  SELECT index_is_type('dvdrental', 'customer', 'customer_pk', 'btree', 'Index dvdrental.customer.customer_pk should be of the correct type.');

  SELECT * FROM finish();
ROLLBACK;
