BEGIN;
  SELECT plan(8);

  SELECT has_schema('dvdrental', 'Schema dvdrental should exist.');

  SELECT has_table('dvdrental', 'staff', 'Table dvdrental.staff should exist.');

  SELECT has_column('dvdrental', 'staff', 'staff_id', 'Column dvdrental.staff.staff_id should exist.');

  SELECT has_role('dbo', 'Role dbo should exist.');

  SELECT index_owner_is('dvdrental', 'staff', 'staff_pk', 'dbo', 'Index dvdrental.staff.staff_pk should have the correct owner.');

  SELECT index_is_primary('dvdrental', 'staff', 'staff_pk', 'Index dvdrental.staff.staff_pk should be a primary key index.');

  SELECT index_is_unique('dvdrental', 'staff', 'staff_pk', 'Index dvdrental.staff.staff_pk should be a unique index.');

  SELECT index_is_type('dvdrental', 'staff', 'staff_pk', 'btree', 'Index dvdrental.staff.staff_pk should be of the correct type.');

  SELECT * FROM finish();
ROLLBACK;
