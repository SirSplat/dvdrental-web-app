BEGIN;
  SELECT plan(6);

  SELECT has_schema('dvdrental', 'Schema dvdrental should exist.');

  SELECT has_table('dvdrental', 'address', 'Table dvdrental.address should exist.');

  SELECT has_column('dvdrental', 'address', 'city_id', 'Column dvdrental.address.city_id should exist.');

  SELECT has_role('dbo', 'Role dbo should exist.');

  SELECT index_owner_is('dvdrental', 'address', 'address_city_id_idx', 'dbo', 'Index dvdrental.address.address_city_id_idx should have the correct owner.');

  SELECT index_is_type('dvdrental', 'address', 'address_city_id_idx', 'btree', 'Index dvdrental.address.address_city_id_idx should be of the correct type.');

  SELECT * FROM finish();
ROLLBACK;
