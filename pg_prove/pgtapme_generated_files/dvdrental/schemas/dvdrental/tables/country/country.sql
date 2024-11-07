BEGIN;
  SELECT plan(16);

  SELECT has_schema('dvdrental', 'Schema dvdrental should exist.');

  SELECT has_table('dvdrental', 'country', 'Table dvdrental.country should exist.');

  SELECT has_role('dbo', 'Role dbo should exist.');

  SELECT table_owner_is('dvdrental', 'country', 'dbo', 'Table dvdrental.country should have the correct owner.');

  SELECT partitions_are('dvdrental', 'country', ARRAY[]::TEXT[], 'Table dvdrental.country should have the correct partitions.');

  SELECT columns_are('dvdrental', 'country', ARRAY['country_id', 'country', 'last_update']::TEXT[], 'Table dvdrental.country should have the correct columns.');

  SELECT indexes_are('dvdrental', 'country', ARRAY['country_pk']::TEXT[], 'Table dvdrental.country should have the correct indexes.');

  SELECT triggers_are('dvdrental', 'country', ARRAY['last_updated_trg']::TEXT[], 'Table dvdrental.country should have the correct triggers.');

  SELECT rules_are('dvdrental', 'country', ARRAY[]::TEXT[], 'Table dvdrental.country should have the correct rules.');

  SELECT has_pk('dvdrental', 'country', 'Table dvdrental.country should have a primary key.');

  SELECT col_is_pk('dvdrental', 'country', ARRAY['country_id']::TEXT[], 'Table dvdrental.country should have the correct primary key columns.');

  SELECT col_isnt_pk('dvdrental', 'country', ARRAY['country', 'last_update']::TEXT[], 'Table dvdrental.country should have the correct primary key columns.');

  SELECT hasnt_fk('dvdrental', 'country', 'Table dvdrental.country should not have a foreign key.');

  SELECT col_isnt_fk('dvdrental', 'country', ARRAY['country', 'last_update', 'country_id']::TEXT[], 'Table dvdrental.country should have the correct foreign key columns.');

  SELECT isnt_partitioned('dvdrental', 'country', 'Table dvdrental.country should not be partitioned.');

  SELECT hasnt_inherited_tables('dvdrental', 'country', 'Table dvdrental.country should not have child tables.');

  SELECT * FROM finish();
ROLLBACK;
