BEGIN;
  SELECT plan(8);

  SELECT has_schema('dvdrental', 'Schema dvdrental should exist.');

  SELECT has_table('dvdrental', 'film', 'Table dvdrental.film should exist.');

  SELECT has_column('dvdrental', 'film', 'fulltext', 'Column dvdrental.film.fulltext should exist.');

  SELECT has_schema('pg_catalog', 'Schema pg_catalog should exist.');

  SELECT has_type('pg_catalog', 'tsvector', 'Data type pg_catalog.tsvector should exist.');

  SELECT col_not_null('dvdrental', 'film', 'fulltext', 'Column dvdrental.film.fulltext should be NOT NULL.');

  SELECT col_hasnt_default('dvdrental', 'film', 'fulltext', 'Column dvdrental.film.fulltext should not have DEFAULT.');

  SELECT col_type_is('dvdrental', 'film', 'fulltext', 'pg_catalog', 'tsvector', 'Column dvdrental.film.fulltext should have the correct type.');

  SELECT * FROM finish();
ROLLBACK;
