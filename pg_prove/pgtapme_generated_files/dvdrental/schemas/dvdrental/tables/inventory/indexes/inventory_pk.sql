BEGIN;
  SELECT plan(8);

  SELECT has_schema('dvdrental', 'Schema dvdrental should exist.');

  SELECT has_table('dvdrental', 'inventory', 'Table dvdrental.inventory should exist.');

  SELECT has_column('dvdrental', 'inventory', 'inventory_id', 'Column dvdrental.inventory.inventory_id should exist.');

  SELECT has_role('dbo', 'Role dbo should exist.');

  SELECT index_owner_is('dvdrental', 'inventory', 'inventory_pk', 'dbo', 'Index dvdrental.inventory.inventory_pk should have the correct owner.');

  SELECT index_is_primary('dvdrental', 'inventory', 'inventory_pk', 'Index dvdrental.inventory.inventory_pk should be a primary key index.');

  SELECT index_is_unique('dvdrental', 'inventory', 'inventory_pk', 'Index dvdrental.inventory.inventory_pk should be a unique index.');

  SELECT index_is_type('dvdrental', 'inventory', 'inventory_pk', 'btree', 'Index dvdrental.inventory.inventory_pk should be of the correct type.');

  SELECT * FROM finish();
ROLLBACK;
