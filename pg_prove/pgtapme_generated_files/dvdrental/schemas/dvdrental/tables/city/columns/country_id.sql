BEGIN;
  SELECT plan(8);

  SELECT has_schema('dvdrental', 'Schema dvdrental should exist.');

  SELECT has_table('dvdrental', 'city', 'Table dvdrental.city should exist.');

  SELECT has_column('dvdrental', 'city', 'country_id', 'Column dvdrental.city.country_id should exist.');

  SELECT has_schema('pg_catalog', 'Schema pg_catalog should exist.');

  SELECT has_type('pg_catalog', 'int2', 'Data type pg_catalog.int2 should exist.');

  SELECT col_not_null('dvdrental', 'city', 'country_id', 'Column dvdrental.city.country_id should be NOT NULL.');

  SELECT col_hasnt_default('dvdrental', 'city', 'country_id', 'Column dvdrental.city.country_id should not have DEFAULT.');

  SELECT col_type_is('dvdrental', 'city', 'country_id', 'pg_catalog', 'smallint', 'Column dvdrental.city.country_id should have the correct type.');

  SELECT * FROM finish();
ROLLBACK;
