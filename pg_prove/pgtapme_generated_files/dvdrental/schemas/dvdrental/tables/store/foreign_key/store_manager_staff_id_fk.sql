BEGIN;
  SELECT plan(7);

  SELECT has_schema('dvdrental', 'Schema dvdrental should exist.');

  SELECT has_table('dvdrental', 'store', 'Table dvdrental.store should exist.');

  SELECT has_column('dvdrental', 'store', 'manager_staff_id', 'Column dvdrental.store.manager_staff_id should exist.');

  SELECT has_schema('dvdrental', 'Schema dvdrental should exist.');

  SELECT has_table('dvdrental', 'staff', 'Table dvdrental.staff should exist.');

  SELECT has_column('dvdrental', 'staff', 'staff_id', 'Column dvdrental.staff.staff_id should exist.');

  SELECT fk_ok('dvdrental', 'store', ARRAY['manager_staff_id']::TEXT[], 'dvdrental', 'staff', ARRAY['staff_id']::TEXT[], 'Foreign key dvdrental.store.store_manager_staff_id_fk should exist.');

  SELECT * FROM finish();
ROLLBACK;
