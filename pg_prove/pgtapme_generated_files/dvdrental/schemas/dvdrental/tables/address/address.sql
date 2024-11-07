BEGIN;
  SELECT plan(17);

  SELECT has_schema('dvdrental', 'Schema dvdrental should exist.');

  SELECT has_table('dvdrental', 'address', 'Table dvdrental.address should exist.');

  SELECT has_role('dbo', 'Role dbo should exist.');

  SELECT table_owner_is('dvdrental', 'address', 'dbo', 'Table dvdrental.address should have the correct owner.');

  SELECT partitions_are('dvdrental', 'address', ARRAY[]::TEXT[], 'Table dvdrental.address should have the correct partitions.');

  SELECT columns_are('dvdrental', 'address', ARRAY['address_id', 'address', 'address2', 'district', 'city_id', 'postal_code', 'phone', 'last_update']::TEXT[], 'Table dvdrental.address should have the correct columns.');

  SELECT indexes_are('dvdrental', 'address', ARRAY['address_pk', 'address_city_id_idx']::TEXT[], 'Table dvdrental.address should have the correct indexes.');

  SELECT triggers_are('dvdrental', 'address', ARRAY['last_updated_trg']::TEXT[], 'Table dvdrental.address should have the correct triggers.');

  SELECT rules_are('dvdrental', 'address', ARRAY[]::TEXT[], 'Table dvdrental.address should have the correct rules.');

  SELECT has_pk('dvdrental', 'address', 'Table dvdrental.address should have a primary key.');

  SELECT col_is_pk('dvdrental', 'address', ARRAY['address_id']::TEXT[], 'Table dvdrental.address should have the correct primary key columns.');

  SELECT col_isnt_pk('dvdrental', 'address', ARRAY['address', 'district', 'postal_code', 'address2', 'last_update', 'phone']::TEXT[], 'Table dvdrental.address should have the correct primary key columns.');

  SELECT has_fk('dvdrental', 'address', 'Table dvdrental.address should have a foreign key.');

  SELECT col_is_fk('dvdrental', 'address', ARRAY['city_id']::TEXT[], 'Table dvdrental.address should have the correct foreign key columns.');

  SELECT col_isnt_fk('dvdrental', 'address', ARRAY['address', 'address_id', 'district', 'postal_code', 'address2', 'last_update']::TEXT[], 'Table dvdrental.address should have the correct foreign key columns.');

  SELECT isnt_partitioned('dvdrental', 'address', 'Table dvdrental.address should not be partitioned.');

  SELECT hasnt_inherited_tables('dvdrental', 'address', 'Table dvdrental.address should not have child tables.');

  SELECT * FROM finish();
ROLLBACK;
