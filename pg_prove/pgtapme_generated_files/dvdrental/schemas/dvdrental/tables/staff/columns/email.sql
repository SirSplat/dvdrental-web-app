BEGIN;
  SELECT plan(8);

  SELECT has_schema('dvdrental', 'Schema dvdrental should exist.');

  SELECT has_table('dvdrental', 'staff', 'Table dvdrental.staff should exist.');

  SELECT has_column('dvdrental', 'staff', 'email', 'Column dvdrental.staff.email should exist.');

  SELECT has_schema('pg_catalog', 'Schema pg_catalog should exist.');

  SELECT has_type('pg_catalog', 'varchar', 'Data type pg_catalog.varchar should exist.');

  SELECT col_is_null('dvdrental', 'staff', 'email', 'Column dvdrental.staff.email should not be NOT NULL.');

  SELECT col_hasnt_default('dvdrental', 'staff', 'email', 'Column dvdrental.staff.email should not have DEFAULT.');

  SELECT col_type_is('dvdrental', 'staff', 'email', 'pg_catalog', 'character varying(50)', 'Column dvdrental.staff.email should have the correct type.');

  SELECT * FROM finish();
ROLLBACK;
