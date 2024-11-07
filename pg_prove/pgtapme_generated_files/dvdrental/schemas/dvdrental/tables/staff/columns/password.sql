BEGIN;
  SELECT plan(8);

  SELECT has_schema('dvdrental', 'Schema dvdrental should exist.');

  SELECT has_table('dvdrental', 'staff', 'Table dvdrental.staff should exist.');

  SELECT has_column('dvdrental', 'staff', 'password', 'Column dvdrental.staff.password should exist.');

  SELECT has_schema('pg_catalog', 'Schema pg_catalog should exist.');

  SELECT has_type('pg_catalog', 'varchar', 'Data type pg_catalog.varchar should exist.');

  SELECT col_is_null('dvdrental', 'staff', 'password', 'Column dvdrental.staff.password should not be NOT NULL.');

  SELECT col_hasnt_default('dvdrental', 'staff', 'password', 'Column dvdrental.staff.password should not have DEFAULT.');

  SELECT col_type_is('dvdrental', 'staff', 'password', 'pg_catalog', 'character varying(40)', 'Column dvdrental.staff.password should have the correct type.');

  SELECT * FROM finish();
ROLLBACK;
