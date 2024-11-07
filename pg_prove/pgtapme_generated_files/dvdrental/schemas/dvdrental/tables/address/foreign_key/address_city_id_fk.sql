BEGIN;
  SELECT plan(7);

  SELECT has_schema('dvdrental', 'Schema dvdrental should exist.');

  SELECT has_table('dvdrental', 'address', 'Table dvdrental.address should exist.');

  SELECT has_column('dvdrental', 'address', 'city_id', 'Column dvdrental.address.city_id should exist.');

  SELECT has_schema('dvdrental', 'Schema dvdrental should exist.');

  SELECT has_table('dvdrental', 'city', 'Table dvdrental.city should exist.');

  SELECT has_column('dvdrental', 'city', 'city_id', 'Column dvdrental.city.city_id should exist.');

  SELECT fk_ok('dvdrental', 'address', ARRAY['city_id']::TEXT[], 'dvdrental', 'city', ARRAY['city_id']::TEXT[], 'Foreign key dvdrental.address.address_city_id_fk should exist.');

  SELECT * FROM finish();
ROLLBACK;
