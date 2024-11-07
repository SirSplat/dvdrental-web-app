BEGIN;
  SELECT plan(9);

  SELECT has_schema('dvdrental', 'Schema dvdrental should exist.');

  SELECT has_table('dvdrental', 'film', 'Table dvdrental.film should exist.');

  SELECT has_column('dvdrental', 'film', 'replacement_cost', 'Column dvdrental.film.replacement_cost should exist.');

  SELECT has_schema('pg_catalog', 'Schema pg_catalog should exist.');

  SELECT has_type('pg_catalog', 'numeric', 'Data type pg_catalog.numeric should exist.');

  SELECT col_not_null('dvdrental', 'film', 'replacement_cost', 'Column dvdrental.film.replacement_cost should be NOT NULL.');

  SELECT col_has_default('dvdrental', 'film', 'replacement_cost', 'Column dvdrental.film.replacement_cost should have DEFAULT.');

  SELECT col_default_is('dvdrental', 'film', 'replacement_cost', '19.99', 'Column dvdrental.film.replacement_cost should have the correct default.');

  SELECT col_type_is('dvdrental', 'film', 'replacement_cost', 'pg_catalog', 'numeric(5,2)', 'Column dvdrental.film.replacement_cost should have the correct type.');

  SELECT * FROM finish();
ROLLBACK;
