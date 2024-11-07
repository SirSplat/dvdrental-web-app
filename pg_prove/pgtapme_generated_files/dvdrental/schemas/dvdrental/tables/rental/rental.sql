BEGIN;
  SELECT plan(19);

  SELECT has_schema('dvdrental', 'Schema dvdrental should exist.');

  SELECT has_table('dvdrental', 'dvdrental', 'Table dvdrental.rental should exist.');

  SELECT has_role('dbo', 'Role dbo should exist.');

  SELECT table_owner_is('dvdrental', 'dvdrental', 'dbo', 'Table dvdrental.rental should have the correct owner.');

  SELECT partitions_are('dvdrental', 'dvdrental', ARRAY[]::TEXT[], 'Table dvdrental.rental should have the correct partitions.');

  SELECT columns_are('dvdrental', 'dvdrental', ARRAY['rental_id', 'rental_date', 'inventory_id', 'customer_id', 'return_date', 'staff_id', 'last_update']::TEXT[], 'Table dvdrental.rental should have the correct columns.');

  SELECT indexes_are('dvdrental', 'dvdrental', ARRAY['rental_pk', 'rental_inventory_id_idx', 'rental_rental_date_inventory_id_customer_id_uidx']::TEXT[], 'Table dvdrental.rental should have the correct indexes.');

  SELECT triggers_are('dvdrental', 'dvdrental', ARRAY['last_updated_trg']::TEXT[], 'Table dvdrental.rental should have the correct triggers.');

  SELECT rules_are('dvdrental', 'dvdrental', ARRAY[]::TEXT[], 'Table dvdrental.rental should have the correct rules.');

  SELECT has_pk('dvdrental', 'dvdrental', 'Table dvdrental.rental should have a primary key.');

  SELECT col_is_pk('dvdrental', 'dvdrental', ARRAY['rental_id']::TEXT[], 'Table dvdrental.rental should have the correct primary key columns.');

  SELECT col_isnt_pk('dvdrental', 'dvdrental', ARRAY['return_date', 'last_update']::TEXT[], 'Table dvdrental.rental should have the correct primary key columns.');

  SELECT has_fk('dvdrental', 'dvdrental', 'Table dvdrental.rental should have a foreign key.');

  SELECT col_is_fk('dvdrental', 'dvdrental', ARRAY['customer_id']::TEXT[], 'Table dvdrental.rental should have the correct foreign key columns.');

  SELECT col_is_fk('dvdrental', 'dvdrental', ARRAY['inventory_id']::TEXT[], 'Table dvdrental.rental should have the correct foreign key columns.');

  SELECT col_is_fk('dvdrental', 'dvdrental', ARRAY['staff_id']::TEXT[], 'Table dvdrental.rental should have the correct foreign key columns.');

  SELECT col_isnt_fk('dvdrental', 'dvdrental', ARRAY['return_date', 'rental_date']::TEXT[], 'Table dvdrental.rental should have the correct foreign key columns.');

  SELECT isnt_partitioned('dvdrental', 'dvdrental', 'Table dvdrental.rental should not be partitioned.');

  SELECT hasnt_inherited_tables('dvdrental', 'dvdrental', 'Table dvdrental.rental should not have child tables.');

  SELECT * FROM finish();
ROLLBACK;
