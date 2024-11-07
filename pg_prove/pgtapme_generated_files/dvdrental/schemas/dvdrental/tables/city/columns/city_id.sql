BEGIN;
  SELECT plan(9);

  SELECT has_schema('dvdrental', 'Schema dvdrental should exist.');

  SELECT has_table('dvdrental', 'city', 'Table dvdrental.city should exist.');

  SELECT has_column('dvdrental', 'city', 'city_id', 'Column dvdrental.city.city_id should exist.');

  SELECT has_schema('pg_catalog', 'Schema pg_catalog should exist.');

  SELECT has_type('pg_catalog', 'int4', 'Data type pg_catalog.int4 should exist.');

  SELECT col_not_null('dvdrental', 'city', 'city_id', 'Column dvdrental.city.city_id should be NOT NULL.');

  SELECT col_has_default('dvdrental', 'city', 'city_id', 'Column dvdrental.city.city_id should have DEFAULT.');

  SELECT col_default_is('dvdrental', 'city', 'city_id', $$nextval('city_city_id_seq'::regclass)$$, 'Column dvdrental.city.city_id should have the correct default.');

  SELECT col_type_is('dvdrental', 'city', 'city_id', 'pg_catalog', 'integer', 'Column dvdrental.city.city_id should have the correct type.');

  SELECT * FROM finish();
ROLLBACK;
