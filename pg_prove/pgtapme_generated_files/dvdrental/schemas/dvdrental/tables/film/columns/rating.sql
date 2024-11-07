BEGIN;
  SELECT plan(9);

  SELECT has_schema('dvdrental', 'Schema dvdrental should exist.');

  SELECT has_table('dvdrental', 'film', 'Table dvdrental.film should exist.');

  SELECT has_column('dvdrental', 'film', 'rating', 'Column dvdrental.film.rating should exist.');

  SELECT has_schema('dvdrental', 'Schema dvdrental should exist.');

  SELECT has_type('dvdrental', 'mpaa_rating', 'Data type dvdrental.mpaa_rating should exist.');

  SELECT col_is_null('dvdrental', 'film', 'rating', 'Column dvdrental.film.rating should not be NOT NULL.');

  SELECT col_has_default('dvdrental', 'film', 'rating', 'Column dvdrental.film.rating should have DEFAULT.');

  SELECT col_default_is('dvdrental', 'film', 'rating', 'G'::mpaa_rating, 'Column dvdrental.film.rating should have the correct default.');

  SELECT col_type_is('dvdrental', 'film', 'rating', 'dvdrental', 'mpaa_rating', 'Column dvdrental.film.rating should have the correct type.');

  SELECT * FROM finish();
ROLLBACK;
