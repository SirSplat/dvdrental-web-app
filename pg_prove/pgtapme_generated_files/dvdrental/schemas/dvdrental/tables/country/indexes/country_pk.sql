BEGIN;
  SELECT plan(8);

  SELECT has_schema('dvdrental', 'Schema dvdrental should exist.');

  SELECT has_table('dvdrental', 'country', 'Table dvdrental.country should exist.');

  SELECT has_column('dvdrental', 'country', 'country_id', 'Column dvdrental.country.country_id should exist.');

  SELECT has_role('dbo', 'Role dbo should exist.');

  SELECT index_owner_is('dvdrental', 'country', 'country_pk', 'dbo', 'Index dvdrental.country.country_pk should have the correct owner.');

  SELECT index_is_primary('dvdrental', 'country', 'country_pk', 'Index dvdrental.country.country_pk should be a primary key index.');

  SELECT index_is_unique('dvdrental', 'country', 'country_pk', 'Index dvdrental.country.country_pk should be a unique index.');

  SELECT index_is_type('dvdrental', 'country', 'country_pk', 'btree', 'Index dvdrental.country.country_pk should be of the correct type.');

  SELECT * FROM finish();
ROLLBACK;
