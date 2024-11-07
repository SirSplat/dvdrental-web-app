BEGIN;
  SELECT plan(17);

  SELECT has_schema('dvdrental', 'Schema dvdrental should exist.');

  SELECT has_table('dvdrental', 'inventory', 'Table dvdrental.inventory should exist.');

  SELECT has_role('dbo', 'Role dbo should exist.');

  SELECT table_owner_is('dvdrental', 'inventory', 'dbo', 'Table dvdrental.inventory should have the correct owner.');

  SELECT partitions_are('dvdrental', 'inventory', ARRAY[]::TEXT[], 'Table dvdrental.inventory should have the correct partitions.');

  SELECT columns_are('dvdrental', 'inventory', ARRAY['inventory_id', 'film_id', 'store_id', 'last_update']::TEXT[], 'Table dvdrental.inventory should have the correct columns.');

  SELECT indexes_are('dvdrental', 'inventory', ARRAY['inventory_pk', 'inventory_store_id_film_id_idx']::TEXT[], 'Table dvdrental.inventory should have the correct indexes.');

  SELECT triggers_are('dvdrental', 'inventory', ARRAY['last_updated_trg']::TEXT[], 'Table dvdrental.inventory should have the correct triggers.');

  SELECT rules_are('dvdrental', 'inventory', ARRAY[]::TEXT[], 'Table dvdrental.inventory should have the correct rules.');

  SELECT has_pk('dvdrental', 'inventory', 'Table dvdrental.inventory should have a primary key.');

  SELECT col_is_pk('dvdrental', 'inventory', ARRAY['inventory_id']::TEXT[], 'Table dvdrental.inventory should have the correct primary key columns.');

  SELECT col_isnt_pk('dvdrental', 'inventory', ARRAY['last_update']::TEXT[], 'Table dvdrental.inventory should have the correct primary key columns.');

  SELECT has_fk('dvdrental', 'inventory', 'Table dvdrental.inventory should have a foreign key.');

  SELECT col_is_fk('dvdrental', 'inventory', ARRAY['film_id']::TEXT[], 'Table dvdrental.inventory should have the correct foreign key columns.');

  SELECT col_isnt_fk('dvdrental', 'inventory', ARRAY['last_update']::TEXT[], 'Table dvdrental.inventory should have the correct foreign key columns.');

  SELECT isnt_partitioned('dvdrental', 'inventory', 'Table dvdrental.inventory should not be partitioned.');

  SELECT hasnt_inherited_tables('dvdrental', 'inventory', 'Table dvdrental.inventory should not have child tables.');

  SELECT * FROM finish();
ROLLBACK;
