BEGIN;
  SELECT plan(9);

  SELECT has_schema('dvdrental', 'Schema dvdrental should exist.');

  SELECT has_table('dvdrental', 'address', 'Table dvdrental.address should exist.');

  SELECT has_column('dvdrental', 'address', 'last_update', 'Column dvdrental.address.last_update should exist.');

  SELECT has_schema('pg_catalog', 'Schema pg_catalog should exist.');

  SELECT has_type('pg_catalog', 'timestamp', 'Data type pg_catalog.timestamp should exist.');

  SELECT col_not_null('dvdrental', 'address', 'last_update', 'Column dvdrental.address.last_update should be NOT NULL.');

  SELECT col_has_default('dvdrental', 'address', 'last_update', 'Column dvdrental.address.last_update should have DEFAULT.');

  SELECT col_default_is('dvdrental', 'address', 'last_update', 'now()', 'Column dvdrental.address.last_update should have the correct default.');

  SELECT col_type_is('dvdrental', 'address', 'last_update', 'pg_catalog', 'timestamp without time zone', 'Column dvdrental.address.last_update should have the correct type.');

  SELECT * FROM finish();
ROLLBACK;
