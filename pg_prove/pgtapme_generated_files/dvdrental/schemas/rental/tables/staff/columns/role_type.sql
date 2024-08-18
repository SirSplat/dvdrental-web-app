BEGIN;
  SELECT plan(9);

  SELECT has_schema('rental', 'Schema rental should exist.');

  SELECT has_table('rental', 'staff', 'Table rental.staff should exist.');

  SELECT has_column('rental', 'staff', 'role_type', 'Column rental.staff.role_type should exist.');

  SELECT has_schema('pg_catalog', 'Schema pg_catalog should exist.');

  SELECT has_type('pg_catalog', 'text', 'Data type pg_catalog.text should exist.');

  SELECT col_not_null('rental', 'staff', 'role_type', 'Column rental.staff.role_type should be NOT NULL.');

  SELECT col_has_default('rental', 'staff', 'role_type', 'Column rental.staff.role_type should have DEFAULT.');

  SELECT col_default_is('rental', 'staff', 'role_type', 'trainee', 'Column rental.staff.role_type should have the correct default.');

  SELECT col_type_is('rental', 'staff', 'role_type', 'pg_catalog', 'text', 'Column rental.staff.role_type should have the correct type.');

  SELECT * FROM finish();
ROLLBACK;
