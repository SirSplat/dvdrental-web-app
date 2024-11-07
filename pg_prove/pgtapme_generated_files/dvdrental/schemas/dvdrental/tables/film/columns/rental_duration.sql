BEGIN;
  SELECT plan(9);

  SELECT has_schema('dvdrental', 'Schema dvdrental should exist.');

  SELECT has_table('dvdrental', 'film', 'Table dvdrental.film should exist.');

  SELECT has_column('dvdrental', 'film', 'rental_duration', 'Column dvdrental.film.rental_duration should exist.');

  SELECT has_schema('pg_catalog', 'Schema pg_catalog should exist.');

  SELECT has_type('pg_catalog', 'int2', 'Data type pg_catalog.int2 should exist.');

  SELECT col_not_null('dvdrental', 'film', 'rental_duration', 'Column dvdrental.film.rental_duration should be NOT NULL.');

  SELECT col_has_default('dvdrental', 'film', 'rental_duration', 'Column dvdrental.film.rental_duration should have DEFAULT.');

  SELECT col_default_is('dvdrental', 'film', 'rental_duration', '3', 'Column dvdrental.film.rental_duration should have the correct default.');

  SELECT col_type_is('dvdrental', 'film', 'rental_duration', 'pg_catalog', 'smallint', 'Column dvdrental.film.rental_duration should have the correct type.');

  SELECT * FROM finish();
ROLLBACK;
