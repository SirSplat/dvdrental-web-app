BEGIN;
  SELECT plan(16);

  SELECT has_schema('dvdrental', 'Schema dvdrental should exist.');

  SELECT has_table('dvdrental', 'category', 'Table dvdrental.category should exist.');

  SELECT has_role('dbo', 'Role dbo should exist.');

  SELECT table_owner_is('dvdrental', 'category', 'dbo', 'Table dvdrental.category should have the correct owner.');

  SELECT partitions_are('dvdrental', 'category', ARRAY[]::TEXT[], 'Table dvdrental.category should have the correct partitions.');

  SELECT columns_are('dvdrental', 'category', ARRAY['category_id', 'name', 'last_update']::TEXT[], 'Table dvdrental.category should have the correct columns.');

  SELECT indexes_are('dvdrental', 'category', ARRAY['category_pk']::TEXT[], 'Table dvdrental.category should have the correct indexes.');

  SELECT triggers_are('dvdrental', 'category', ARRAY['last_updated_trg']::TEXT[], 'Table dvdrental.category should have the correct triggers.');

  SELECT rules_are('dvdrental', 'category', ARRAY[]::TEXT[], 'Table dvdrental.category should have the correct rules.');

  SELECT has_pk('dvdrental', 'category', 'Table dvdrental.category should have a primary key.');

  SELECT col_is_pk('dvdrental', 'category', ARRAY['category_id']::TEXT[], 'Table dvdrental.category should have the correct primary key columns.');

  SELECT col_isnt_pk('dvdrental', 'category', ARRAY['last_update']::TEXT[], 'Table dvdrental.category should have the correct primary key columns.');

  SELECT hasnt_fk('dvdrental', 'category', 'Table dvdrental.category should not have a foreign key.');

  SELECT col_isnt_fk('dvdrental', 'category', ARRAY['category_id', 'name', 'last_update']::TEXT[], 'Table dvdrental.category should have the correct foreign key columns.');

  SELECT isnt_partitioned('dvdrental', 'category', 'Table dvdrental.category should not be partitioned.');

  SELECT hasnt_inherited_tables('dvdrental', 'category', 'Table dvdrental.category should not have child tables.');

  SELECT * FROM finish();
ROLLBACK;
