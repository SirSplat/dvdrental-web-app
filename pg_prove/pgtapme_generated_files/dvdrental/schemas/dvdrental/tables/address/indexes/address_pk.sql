BEGIN;
  SELECT plan(8);

  SELECT has_schema('dvdrental', 'Schema dvdrental should exist.');

  SELECT has_table('dvdrental', 'address', 'Table dvdrental.address should exist.');

  SELECT has_column('dvdrental', 'address', 'address_id', 'Column dvdrental.address.address_id should exist.');

  SELECT has_role('dbo', 'Role dbo should exist.');

  SELECT index_owner_is('dvdrental', 'address', 'address_pk', 'dbo', 'Index dvdrental.address.address_pk should have the correct owner.');

  SELECT index_is_primary('dvdrental', 'address', 'address_pk', 'Index dvdrental.address.address_pk should be a primary key index.');

  SELECT index_is_unique('dvdrental', 'address', 'address_pk', 'Index dvdrental.address.address_pk should be a unique index.');

  SELECT index_is_type('dvdrental', 'address', 'address_pk', 'btree', 'Index dvdrental.address.address_pk should be of the correct type.');

  SELECT * FROM finish();
ROLLBACK;
