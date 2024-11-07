BEGIN;
  SELECT plan(8);

  SELECT has_schema('dvdrental', 'Schema dvdrental should exist.');

  SELECT has_table('dvdrental', 'staff', 'Table dvdrental.staff should exist.');

  SELECT has_column('dvdrental', 'staff', 'picture', 'Column dvdrental.staff.picture should exist.');

  SELECT has_schema('pg_catalog', 'Schema pg_catalog should exist.');

  SELECT has_type('pg_catalog', 'bytea', 'Data type pg_catalog.bytea should exist.');

  SELECT col_is_null('dvdrental', 'staff', 'picture', 'Column dvdrental.staff.picture should not be NOT NULL.');

  SELECT col_hasnt_default('dvdrental', 'staff', 'picture', 'Column dvdrental.staff.picture should not have DEFAULT.');

  SELECT col_type_is('dvdrental', 'staff', 'picture', 'pg_catalog', 'text', 'Column dvdrental.staff.picture should have the correct type.');

  SELECT * FROM finish();
ROLLBACK;
