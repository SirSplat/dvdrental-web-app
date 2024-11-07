BEGIN;
  SELECT plan(8);

  SELECT has_schema('dvdrental', 'Schema dvdrental should exist.');

  SELECT has_table('dvdrental', 'film', 'Table dvdrental.film should exist.');

  SELECT has_column('dvdrental', 'film', 'title', 'Column dvdrental.film.title should exist.');

  SELECT has_schema('pg_catalog', 'Schema pg_catalog should exist.');

  SELECT has_type('pg_catalog', 'varchar', 'Data type pg_catalog.varchar should exist.');

  SELECT col_not_null('dvdrental', 'film', 'title', 'Column dvdrental.film.title should be NOT NULL.');

  SELECT col_hasnt_default('dvdrental', 'film', 'title', 'Column dvdrental.film.title should not have DEFAULT.');

  SELECT col_type_is('dvdrental', 'film', 'title', 'pg_catalog', 'character varying(255)', 'Column dvdrental.film.title should have the correct type.');

  SELECT * FROM finish();
ROLLBACK;
