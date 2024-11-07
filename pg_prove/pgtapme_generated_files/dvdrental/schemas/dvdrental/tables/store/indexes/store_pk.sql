BEGIN;
  SELECT plan(8);

  SELECT has_schema('dvdrental', 'Schema dvdrental should exist.');

  SELECT has_table('dvdrental', 'store', 'Table dvdrental.store should exist.');

  SELECT has_column('dvdrental', 'store', 'store_id', 'Column dvdrental.store.store_id should exist.');

  SELECT has_role('dbo', 'Role dbo should exist.');

  SELECT index_owner_is('dvdrental', 'store', 'store_pk', 'dbo', 'Index dvdrental.store.store_pk should have the correct owner.');

  SELECT index_is_primary('dvdrental', 'store', 'store_pk', 'Index dvdrental.store.store_pk should be a primary key index.');

  SELECT index_is_unique('dvdrental', 'store', 'store_pk', 'Index dvdrental.store.store_pk should be a unique index.');

  SELECT index_is_type('dvdrental', 'store', 'store_pk', 'btree', 'Index dvdrental.store.store_pk should be of the correct type.');

  SELECT * FROM finish();
ROLLBACK;
