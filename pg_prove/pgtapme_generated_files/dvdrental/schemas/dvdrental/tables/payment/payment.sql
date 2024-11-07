BEGIN;
  SELECT plan(19);

  SELECT has_schema('dvdrental', 'Schema dvdrental should exist.');

  SELECT has_table('dvdrental', 'payment', 'Table dvdrental.payment should exist.');

  SELECT has_role('dbo', 'Role dbo should exist.');

  SELECT table_owner_is('dvdrental', 'payment', 'dbo', 'Table dvdrental.payment should have the correct owner.');

  SELECT partitions_are('dvdrental', 'payment', ARRAY[]::TEXT[], 'Table dvdrental.payment should have the correct partitions.');

  SELECT columns_are('dvdrental', 'payment', ARRAY['payment_id', 'customer_id', 'staff_id', 'rental_id', 'amount', 'payment_date']::TEXT[], 'Table dvdrental.payment should have the correct columns.');

  SELECT indexes_are('dvdrental', 'payment', ARRAY['payment_pk', 'payment_customer_id_idx', 'payment_rental_id_idx', 'payment_staff_id_idx']::TEXT[], 'Table dvdrental.payment should have the correct indexes.');

  SELECT triggers_are('dvdrental', 'payment', ARRAY[]::TEXT[], 'Table dvdrental.payment should have the correct triggers.');

  SELECT rules_are('dvdrental', 'payment', ARRAY[]::TEXT[], 'Table dvdrental.payment should have the correct rules.');

  SELECT has_pk('dvdrental', 'payment', 'Table dvdrental.payment should have a primary key.');

  SELECT col_is_pk('dvdrental', 'payment', ARRAY['payment_id']::TEXT[], 'Table dvdrental.payment should have the correct primary key columns.');

  SELECT col_isnt_pk('dvdrental', 'payment', ARRAY['payment_date', 'amount']::TEXT[], 'Table dvdrental.payment should have the correct primary key columns.');

  SELECT has_fk('dvdrental', 'payment', 'Table dvdrental.payment should have a foreign key.');

  SELECT col_is_fk('dvdrental', 'payment', ARRAY['customer_id']::TEXT[], 'Table dvdrental.payment should have the correct foreign key columns.');

  SELECT col_is_fk('dvdrental', 'payment', ARRAY['rental_id']::TEXT[], 'Table dvdrental.payment should have the correct foreign key columns.');

  SELECT col_is_fk('dvdrental', 'payment', ARRAY['staff_id']::TEXT[], 'Table dvdrental.payment should have the correct foreign key columns.');

  SELECT col_isnt_fk('dvdrental', 'payment', ARRAY['payment_date', 'payment_id', 'amount']::TEXT[], 'Table dvdrental.payment should have the correct foreign key columns.');

  SELECT isnt_partitioned('dvdrental', 'payment', 'Table dvdrental.payment should not be partitioned.');

  SELECT hasnt_inherited_tables('dvdrental', 'payment', 'Table dvdrental.payment should not have child tables.');

  SELECT * FROM finish();
ROLLBACK;
