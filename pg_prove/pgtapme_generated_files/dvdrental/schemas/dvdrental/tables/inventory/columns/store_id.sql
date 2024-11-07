BEGIN;
  SELECT plan(8);

  SELECT has_schema('dvdrental', 'Schema dvdrental should exist.');

  SELECT has_table('dvdrental', 'inventory', 'Table dvdrental.inventory should exist.');

  SELECT has_column('dvdrental', 'inventory', 'store_id', 'Column dvdrental.inventory.store_id should exist.');

  SELECT has_schema('pg_catalog', 'Schema pg_catalog should exist.');

  SELECT has_type('pg_catalog', 'int2', 'Data type pg_catalog.int2 should exist.');

  SELECT col_not_null('dvdrental', 'inventory', 'store_id', 'Column dvdrental.inventory.store_id should be NOT NULL.');

  SELECT col_hasnt_default('dvdrental', 'inventory', 'store_id', 'Column dvdrental.inventory.store_id should not have DEFAULT.');

  SELECT col_type_is('dvdrental', 'inventory', 'store_id', 'pg_catalog', 'smallint', 'Column dvdrental.inventory.store_id should have the correct type.');

  SELECT * FROM finish();
ROLLBACK;
