BEGIN;
  SELECT plan(6);

  SELECT has_schema('dvdrental', 'Schema dvdrental should exist.');

  SELECT has_table('dvdrental', 'city', 'Table dvdrental.city should exist.');

  SELECT has_column('dvdrental', 'city', 'country_id', 'Column dvdrental.city.country_id should exist.');

  SELECT has_role('dbo', 'Role dbo should exist.');

  SELECT index_owner_is('dvdrental', 'city', 'city_country_id_idx', 'dbo', 'Index dvdrental.city.city_country_id_idx should have the correct owner.');

  SELECT index_is_type('dvdrental', 'city', 'city_country_id_idx', 'btree', 'Index dvdrental.city.city_country_id_idx should be of the correct type.');

  SELECT * FROM finish();
ROLLBACK;
