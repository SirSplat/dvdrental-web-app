BEGIN;
  SELECT plan(9);

  SELECT has_schema('dvdrental', 'Schema dvdrental should exist.');

  SELECT has_table('dvdrental', 'staff', 'Table dvdrental.staff should exist.');

  SELECT has_column('dvdrental', 'staff', 'active', 'Column dvdrental.staff.active should exist.');

  SELECT has_schema('pg_catalog', 'Schema pg_catalog should exist.');

  SELECT has_type('pg_catalog', 'bool', 'Data type pg_catalog.bool should exist.');

  SELECT col_not_null('dvdrental', 'staff', 'active', 'Column dvdrental.staff.active should be NOT NULL.');

  SELECT col_has_default('dvdrental', 'staff', 'active', 'Column dvdrental.staff.active should have DEFAULT.');

  SELECT col_default_is('dvdrental', 'staff', 'active', 'true', 'Column dvdrental.staff.active should have the correct default.');

  SELECT col_type_is('dvdrental', 'staff', 'active', 'pg_catalog', 'boolean', 'Column dvdrental.staff.active should have the correct type.');

  SELECT * FROM finish();
ROLLBACK;
