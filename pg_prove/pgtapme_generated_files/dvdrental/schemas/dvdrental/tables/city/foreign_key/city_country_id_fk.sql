BEGIN;
  SELECT plan(7);

  SELECT has_schema('dvdrental', 'Schema dvdrental should exist.');

  SELECT has_table('dvdrental', 'city', 'Table dvdrental.city should exist.');

  SELECT has_column('dvdrental', 'city', 'country_id', 'Column dvdrental.city.country_id should exist.');

  SELECT has_schema('dvdrental', 'Schema dvdrental should exist.');

  SELECT has_table('dvdrental', 'country', 'Table dvdrental.country should exist.');

  SELECT has_column('dvdrental', 'country', 'country_id', 'Column dvdrental.country.country_id should exist.');

  SELECT fk_ok('dvdrental', 'city', ARRAY['country_id']::TEXT[], 'dvdrental', 'country', ARRAY['country_id']::TEXT[], 'Foreign key dvdrental.city.city_country_id_fk should exist.');

  SELECT * FROM finish();
ROLLBACK;
