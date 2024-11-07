BEGIN;
  SELECT plan(9);

  SELECT has_schema('dvdrental', 'Schema dvdrental should exist.');

  SELECT has_table('dvdrental', 'language', 'Table dvdrental.language should exist.');

  SELECT has_column('dvdrental', 'language', 'language_id', 'Column dvdrental.language.language_id should exist.');

  SELECT has_schema('pg_catalog', 'Schema pg_catalog should exist.');

  SELECT has_type('pg_catalog', 'int4', 'Data type pg_catalog.int4 should exist.');

  SELECT col_not_null('dvdrental', 'language', 'language_id', 'Column dvdrental.language.language_id should be NOT NULL.');

  SELECT col_has_default('dvdrental', 'language', 'language_id', 'Column dvdrental.language.language_id should have DEFAULT.');

  SELECT col_default_is('dvdrental', 'language', 'language_id', $$nextval('language_language_id_seq'::regclass)$$, 'Column dvdrental.language.language_id should have the correct default.');

  SELECT col_type_is('dvdrental', 'language', 'language_id', 'pg_catalog', 'integer', 'Column dvdrental.language.language_id should have the correct type.');

  SELECT * FROM finish();
ROLLBACK;
