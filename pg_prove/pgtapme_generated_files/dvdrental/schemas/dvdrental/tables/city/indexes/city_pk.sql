BEGIN;
  SELECT plan(8);

  SELECT has_schema('dvdrental', 'Schema dvdrental should exist.');

  SELECT has_table('dvdrental', 'city', 'Table dvdrental.city should exist.');

  SELECT has_column('dvdrental', 'city', 'city_id', 'Column dvdrental.city.city_id should exist.');

  SELECT has_role('dbo', 'Role dbo should exist.');

  SELECT index_owner_is('dvdrental', 'city', 'city_pk', 'dbo', 'Index dvdrental.city.city_pk should have the correct owner.');

  SELECT index_is_primary('dvdrental', 'city', 'city_pk', 'Index dvdrental.city.city_pk should be a primary key index.');

  SELECT index_is_unique('dvdrental', 'city', 'city_pk', 'Index dvdrental.city.city_pk should be a unique index.');

  SELECT index_is_type('dvdrental', 'city', 'city_pk', 'btree', 'Index dvdrental.city.city_pk should be of the correct type.');

  SELECT * FROM finish();
ROLLBACK;
