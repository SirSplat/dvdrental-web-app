BEGIN;
  SELECT plan(17);

  SELECT has_schema('dvdrental', 'Schema dvdrental should exist.');

  SELECT has_table('dvdrental', 'staff', 'Table dvdrental.staff should exist.');

  SELECT has_role('dbo', 'Role dbo should exist.');

  SELECT table_owner_is('dvdrental', 'staff', 'dbo', 'Table dvdrental.staff should have the correct owner.');

  SELECT partitions_are('dvdrental', 'staff', ARRAY[]::TEXT[], 'Table dvdrental.staff should have the correct partitions.');

  SELECT columns_are('dvdrental', 'staff', ARRAY['staff_id', 'first_name', 'last_name', 'address_id', 'email', 'store_id', 'active', 'username', 'password', 'last_update', 'picture', 'role_type']::TEXT[], 'Table dvdrental.staff should have the correct columns.');

  SELECT indexes_are('dvdrental', 'staff', ARRAY['staff_pk']::TEXT[], 'Table dvdrental.staff should have the correct indexes.');

  SELECT triggers_are('dvdrental', 'staff', ARRAY['last_updated_trg']::TEXT[], 'Table dvdrental.staff should have the correct triggers.');

  SELECT rules_are('dvdrental', 'staff', ARRAY[]::TEXT[], 'Table dvdrental.staff should have the correct rules.');

  SELECT has_pk('dvdrental', 'staff', 'Table dvdrental.staff should have a primary key.');

  SELECT col_is_pk('dvdrental', 'staff', ARRAY['staff_id']::TEXT[], 'Table dvdrental.staff should have the correct primary key columns.');

  SELECT col_isnt_pk('dvdrental', 'staff', ARRAY['active', 'picture', 'first_name', 'email', 'password', 'username', 'last_update', 'role_type']::TEXT[], 'Table dvdrental.staff should have the correct primary key columns.');

  SELECT has_fk('dvdrental', 'staff', 'Table dvdrental.staff should have a foreign key.');

  SELECT col_is_fk('dvdrental', 'staff', ARRAY['address_id']::TEXT[], 'Table dvdrental.staff should have the correct foreign key columns.');

  SELECT col_isnt_fk('dvdrental', 'staff', ARRAY['active', 'picture', 'staff_id', 'first_name', 'email', 'password', 'username', 'store_id', 'role_type']::TEXT[], 'Table dvdrental.staff should have the correct foreign key columns.');

  SELECT isnt_partitioned('dvdrental', 'staff', 'Table dvdrental.staff should not be partitioned.');

  SELECT hasnt_inherited_tables('dvdrental', 'staff', 'Table dvdrental.staff should not have child tables.');

  SELECT * FROM finish();
ROLLBACK;
