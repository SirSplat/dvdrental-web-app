BEGIN;
  SELECT plan(9);

  SELECT has_schema('dvdrental', 'Schema dvdrental should exist.');

  SELECT has_table('dvdrental', 'staff', 'Table dvdrental.staff should exist.');

  SELECT has_column('dvdrental', 'staff', 'role_type', 'Column dvdrental.staff.role_type should exist.');

  SELECT has_schema('pg_catalog', 'Schema pg_catalog should exist.');

  SELECT has_type('pg_catalog', 'text', 'Data type pg_catalog.text should exist.');

  SELECT col_not_null('dvdrental', 'staff', 'role_type', 'Column dvdrental.staff.role_type should be NOT NULL.');

  SELECT col_has_default('dvdrental', 'staff', 'role_type', 'Column dvdrental.staff.role_type should have DEFAULT.');

  SELECT col_default_is('dvdrental', 'staff', 'role_type', 'trainee', 'Column dvdrental.staff.role_type should have the correct default.');

  SELECT col_type_is('dvdrental', 'staff', 'role_type', 'pg_catalog', 'text', 'Column dvdrental.staff.role_type should have the correct type.');

  SELECT * FROM finish();
ROLLBACK;
