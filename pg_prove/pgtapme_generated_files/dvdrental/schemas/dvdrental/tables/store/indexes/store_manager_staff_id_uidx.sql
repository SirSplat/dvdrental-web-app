BEGIN;
  SELECT plan(7);

  SELECT has_schema('dvdrental', 'Schema dvdrental should exist.');

  SELECT has_table('dvdrental', 'store', 'Table dvdrental.store should exist.');

  SELECT has_column('dvdrental', 'store', 'manager_staff_id', 'Column dvdrental.store.manager_staff_id should exist.');

  SELECT has_role('dbo', 'Role dbo should exist.');

  SELECT index_owner_is('dvdrental', 'store', 'store_manager_staff_id_uidx', 'dbo', 'Index dvdrental.store.store_manager_staff_id_uidx should have the correct owner.');

  SELECT index_is_unique('dvdrental', 'store', 'store_manager_staff_id_uidx', 'Index dvdrental.store.store_manager_staff_id_uidx should be a unique index.');

  SELECT index_is_type('dvdrental', 'store', 'store_manager_staff_id_uidx', 'btree', 'Index dvdrental.store.store_manager_staff_id_uidx should be of the correct type.');

  SELECT * FROM finish();
ROLLBACK;
