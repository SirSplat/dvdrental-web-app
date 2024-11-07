BEGIN;
  SELECT plan(16);

  SELECT has_schema('dvdrental', 'Schema dvdrental should exist.');

  SELECT has_table('dvdrental', 'language', 'Table dvdrental.language should exist.');

  SELECT has_role('dbo', 'Role dbo should exist.');

  SELECT table_owner_is('dvdrental', 'language', 'dbo', 'Table dvdrental.language should have the correct owner.');

  SELECT partitions_are('dvdrental', 'language', ARRAY[]::TEXT[], 'Table dvdrental.language should have the correct partitions.');

  SELECT columns_are('dvdrental', 'language', ARRAY['language_id', 'name', 'last_update']::TEXT[], 'Table dvdrental.language should have the correct columns.');

  SELECT indexes_are('dvdrental', 'language', ARRAY['language_pk']::TEXT[], 'Table dvdrental.language should have the correct indexes.');

  SELECT triggers_are('dvdrental', 'language', ARRAY['last_updated_trg']::TEXT[], 'Table dvdrental.language should have the correct triggers.');

  SELECT rules_are('dvdrental', 'language', ARRAY[]::TEXT[], 'Table dvdrental.language should have the correct rules.');

  SELECT has_pk('dvdrental', 'language', 'Table dvdrental.language should have a primary key.');

  SELECT col_is_pk('dvdrental', 'language', ARRAY['language_id']::TEXT[], 'Table dvdrental.language should have the correct primary key columns.');

  SELECT col_isnt_pk('dvdrental', 'language', ARRAY['last_update']::TEXT[], 'Table dvdrental.language should have the correct primary key columns.');

  SELECT hasnt_fk('dvdrental', 'language', 'Table dvdrental.language should not have a foreign key.');

  SELECT col_isnt_fk('dvdrental', 'language', ARRAY['name', 'language_id', 'last_update']::TEXT[], 'Table dvdrental.language should have the correct foreign key columns.');

  SELECT isnt_partitioned('dvdrental', 'language', 'Table dvdrental.language should not be partitioned.');

  SELECT hasnt_inherited_tables('dvdrental', 'language', 'Table dvdrental.language should not have child tables.');

  SELECT * FROM finish();
ROLLBACK;
