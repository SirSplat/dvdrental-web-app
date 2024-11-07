BEGIN;
  SELECT plan(8);

  SELECT has_schema('dvdrental', 'Schema dvdrental should exist.');

  SELECT has_table('dvdrental', 'address', 'Table dvdrental.address should exist.');

  SELECT has_column('dvdrental', 'address', 'district', 'Column dvdrental.address.district should exist.');

  SELECT has_schema('pg_catalog', 'Schema pg_catalog should exist.');

  SELECT has_type('pg_catalog', 'varchar', 'Data type pg_catalog.varchar should exist.');

  SELECT col_not_null('dvdrental', 'address', 'district', 'Column dvdrental.address.district should be NOT NULL.');

  SELECT col_hasnt_default('dvdrental', 'address', 'district', 'Column dvdrental.address.district should not have DEFAULT.');

  SELECT col_type_is('dvdrental', 'address', 'district', 'pg_catalog', 'character varying(20)', 'Column dvdrental.address.district should have the correct type.');

  SELECT * FROM finish();
ROLLBACK;
