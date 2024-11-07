BEGIN;
  SELECT plan(8);

  SELECT has_schema('dvdrental', 'Schema dvdrental should exist.');

  SELECT has_table('dvdrental', 'dvdrental', 'Table dvdrental.rental should exist.');

  SELECT has_column('dvdrental', 'dvdrental', 'rental_date', 'Column dvdrental.rental.rental_date should exist.');

  SELECT has_schema('pg_catalog', 'Schema pg_catalog should exist.');

  SELECT has_type('pg_catalog', 'timestamp', 'Data type pg_catalog.timestamp should exist.');

  SELECT col_not_null('dvdrental', 'dvdrental', 'rental_date', 'Column dvdrental.rental.rental_date should be NOT NULL.');

  SELECT col_hasnt_default('dvdrental', 'dvdrental', 'rental_date', 'Column dvdrental.rental.rental_date should not have DEFAULT.');

  SELECT col_type_is('dvdrental', 'dvdrental', 'rental_date', 'pg_catalog', 'timestamp without time zone', 'Column dvdrental.rental.rental_date should have the correct type.');

  SELECT * FROM finish();
ROLLBACK;
