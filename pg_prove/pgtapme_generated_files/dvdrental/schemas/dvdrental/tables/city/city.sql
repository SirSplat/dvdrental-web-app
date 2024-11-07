BEGIN;
  SELECT plan(17);

  SELECT has_schema('dvdrental', 'Schema dvdrental should exist.');

  SELECT has_table('dvdrental', 'city', 'Table dvdrental.city should exist.');

  SELECT has_role('dbo', 'Role dbo should exist.');

  SELECT table_owner_is('dvdrental', 'city', 'dbo', 'Table dvdrental.city should have the correct owner.');

  SELECT partitions_are('dvdrental', 'city', ARRAY[]::TEXT[], 'Table dvdrental.city should have the correct partitions.');

  SELECT columns_are('dvdrental', 'city', ARRAY['city_id', 'city', 'country_id', 'last_update']::TEXT[], 'Table dvdrental.city should have the correct columns.');

  SELECT indexes_are('dvdrental', 'city', ARRAY['city_pk', 'city_country_id_idx']::TEXT[], 'Table dvdrental.city should have the correct indexes.');

  SELECT triggers_are('dvdrental', 'city', ARRAY['last_updated_trg']::TEXT[], 'Table dvdrental.city should have the correct triggers.');

  SELECT rules_are('dvdrental', 'city', ARRAY[]::TEXT[], 'Table dvdrental.city should have the correct rules.');

  SELECT has_pk('dvdrental', 'city', 'Table dvdrental.city should have a primary key.');

  SELECT col_is_pk('dvdrental', 'city', ARRAY['city_id']::TEXT[], 'Table dvdrental.city should have the correct primary key columns.');

  SELECT col_isnt_pk('dvdrental', 'city', ARRAY['city', 'last_update']::TEXT[], 'Table dvdrental.city should have the correct primary key columns.');

  SELECT has_fk('dvdrental', 'city', 'Table dvdrental.city should have a foreign key.');

  SELECT col_is_fk('dvdrental', 'city', ARRAY['country_id']::TEXT[], 'Table dvdrental.city should have the correct foreign key columns.');

  SELECT col_isnt_fk('dvdrental', 'city', ARRAY['city_id', 'city']::TEXT[], 'Table dvdrental.city should have the correct foreign key columns.');

  SELECT isnt_partitioned('dvdrental', 'city', 'Table dvdrental.city should not be partitioned.');

  SELECT hasnt_inherited_tables('dvdrental', 'city', 'Table dvdrental.city should not have child tables.');

  SELECT * FROM finish();
ROLLBACK;
