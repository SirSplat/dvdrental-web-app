BEGIN;
  SELECT plan(8);

  SELECT has_schema('dvdrental', 'Schema dvdrental should exist.');

  SELECT has_table('dvdrental', 'film', 'Table dvdrental.film should exist.');

  SELECT has_column('dvdrental', 'film', 'release_year', 'Column dvdrental.film.release_year should exist.');

  SELECT has_schema('dvdrental', 'Schema dvdrental should exist.');

  SELECT has_type('dvdrental', 'year', 'Data type dvdrental.year should exist.');

  SELECT col_is_null('dvdrental', 'film', 'release_year', 'Column dvdrental.film.release_year should not be NOT NULL.');

  SELECT col_hasnt_default('dvdrental', 'film', 'release_year', 'Column dvdrental.film.release_year should not have DEFAULT.');

  SELECT col_type_is('dvdrental', 'film', 'release_year', 'dvdrental', 'year', 'Column dvdrental.film.release_year should have the correct type.');

  SELECT * FROM finish();
ROLLBACK;
