BEGIN;
  SELECT plan(16);

  SELECT has_schema('dvdrental', 'Schema dvdrental should exist.');

  SELECT has_table('dvdrental', 'actor', 'Table dvdrental.actor should exist.');

  SELECT has_role('dbo', 'Role dbo should exist.');

  SELECT table_owner_is('dvdrental', 'actor', 'dbo', 'Table dvdrental.actor should have the correct owner.');

  SELECT partitions_are('dvdrental', 'actor', ARRAY[]::TEXT[], 'Table dvdrental.actor should have the correct partitions.');

  SELECT columns_are('dvdrental', 'actor', ARRAY['actor_id', 'first_name', 'last_name', 'last_update']::TEXT[], 'Table dvdrental.actor should have the correct columns.');

  SELECT indexes_are('dvdrental', 'actor', ARRAY['actor_pk', 'actor_last_name_idx']::TEXT[], 'Table dvdrental.actor should have the correct indexes.');

  SELECT triggers_are('dvdrental', 'actor', ARRAY['last_updated_trg']::TEXT[], 'Table dvdrental.actor should have the correct triggers.');

  SELECT rules_are('dvdrental', 'actor', ARRAY[]::TEXT[], 'Table dvdrental.actor should have the correct rules.');

  SELECT has_pk('dvdrental', 'actor', 'Table dvdrental.actor should have a primary key.');

  SELECT col_is_pk('dvdrental', 'actor', ARRAY['actor_id']::TEXT[], 'Table dvdrental.actor should have the correct primary key columns.');

  SELECT col_isnt_pk('dvdrental', 'actor', ARRAY['first_name', 'last_update']::TEXT[], 'Table dvdrental.actor should have the correct primary key columns.');

  SELECT hasnt_fk('dvdrental', 'actor', 'Table dvdrental.actor should not have a foreign key.');

  SELECT col_isnt_fk('dvdrental', 'actor', ARRAY['actor_id', 'last_name', 'first_name', 'last_update']::TEXT[], 'Table dvdrental.actor should have the correct foreign key columns.');

  SELECT isnt_partitioned('dvdrental', 'actor', 'Table dvdrental.actor should not be partitioned.');

  SELECT hasnt_inherited_tables('dvdrental', 'actor', 'Table dvdrental.actor should not have child tables.');

  SELECT * FROM finish();
ROLLBACK;
