BEGIN;
  SELECT plan(8);

  SELECT has_schema('dvdrental', 'Schema dvdrental should exist.');

  SELECT has_table('dvdrental', 'staff', 'Table dvdrental.staff should exist.');

  SELECT has_column('dvdrental', 'staff', 'username', 'Column dvdrental.staff.username should exist.');

  SELECT has_schema('pg_catalog', 'Schema pg_catalog should exist.');

  SELECT has_type('pg_catalog', 'varchar', 'Data type pg_catalog.varchar should exist.');

  SELECT col_not_null('dvdrental', 'staff', 'username', 'Column dvdrental.staff.username should be NOT NULL.');

  SELECT col_hasnt_default('dvdrental', 'staff', 'username', 'Column dvdrental.staff.username should not have DEFAULT.');

  SELECT col_type_is('dvdrental', 'staff', 'username', 'pg_catalog', 'character varying(16)', 'Column dvdrental.staff.username should have the correct type.');

  SELECT * FROM finish();
ROLLBACK;
