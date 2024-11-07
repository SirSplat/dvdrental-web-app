BEGIN;
  SELECT plan(17);

  SELECT has_schema('dvdrental', 'Schema dvdrental should exist.');

  SELECT has_table('dvdrental', 'customer', 'Table dvdrental.customer should exist.');

  SELECT has_role('dbo', 'Role dbo should exist.');

  SELECT table_owner_is('dvdrental', 'customer', 'dbo', 'Table dvdrental.customer should have the correct owner.');

  SELECT partitions_are('dvdrental', 'customer', ARRAY[]::TEXT[], 'Table dvdrental.customer should have the correct partitions.');

  SELECT columns_are('dvdrental', 'customer', ARRAY['customer_id', 'store_id', 'first_name', 'last_name', 'email', 'address_id', 'activebool', 'create_date', 'last_update', 'active']::TEXT[], 'Table dvdrental.customer should have the correct columns.');

  SELECT indexes_are('dvdrental', 'customer', ARRAY['customer_pk', 'customer_address_id_idx', 'customer_store_id_idx', 'customer_last_name_idx']::TEXT[], 'Table dvdrental.customer should have the correct indexes.');

  SELECT triggers_are('dvdrental', 'customer', ARRAY['last_updated_trg']::TEXT[], 'Table dvdrental.customer should have the correct triggers.');

  SELECT rules_are('dvdrental', 'customer', ARRAY[]::TEXT[], 'Table dvdrental.customer should have the correct rules.');

  SELECT has_pk('dvdrental', 'customer', 'Table dvdrental.customer should have a primary key.');

  SELECT col_is_pk('dvdrental', 'customer', ARRAY['customer_id']::TEXT[], 'Table dvdrental.customer should have the correct primary key columns.');

  SELECT col_isnt_pk('dvdrental', 'customer', ARRAY['create_date', 'active', 'activebool', 'first_name', 'email', 'last_update']::TEXT[], 'Table dvdrental.customer should have the correct primary key columns.');

  SELECT has_fk('dvdrental', 'customer', 'Table dvdrental.customer should have a foreign key.');

  SELECT col_is_fk('dvdrental', 'customer', ARRAY['address_id']::TEXT[], 'Table dvdrental.customer should have the correct foreign key columns.');

  SELECT col_isnt_fk('dvdrental', 'customer', ARRAY['create_date', 'active', 'activebool', 'last_name', 'customer_id', 'first_name', 'email', 'last_update']::TEXT[], 'Table dvdrental.customer should have the correct foreign key columns.');

  SELECT isnt_partitioned('dvdrental', 'customer', 'Table dvdrental.customer should not be partitioned.');

  SELECT hasnt_inherited_tables('dvdrental', 'customer', 'Table dvdrental.customer should not have child tables.');

  SELECT * FROM finish();
ROLLBACK;
