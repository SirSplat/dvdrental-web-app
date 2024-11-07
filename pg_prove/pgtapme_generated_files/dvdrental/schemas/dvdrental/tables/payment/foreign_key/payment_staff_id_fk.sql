BEGIN;
  SELECT plan(7);

  SELECT has_schema('dvdrental', 'Schema dvdrental should exist.');

  SELECT has_table('dvdrental', 'payment', 'Table dvdrental.payment should exist.');

  SELECT has_column('dvdrental', 'payment', 'staff_id', 'Column dvdrental.payment.staff_id should exist.');

  SELECT has_schema('dvdrental', 'Schema dvdrental should exist.');

  SELECT has_table('dvdrental', 'staff', 'Table dvdrental.staff should exist.');

  SELECT has_column('dvdrental', 'staff', 'staff_id', 'Column dvdrental.staff.staff_id should exist.');

  SELECT fk_ok('dvdrental', 'payment', ARRAY['staff_id']::TEXT[], 'dvdrental', 'staff', ARRAY['staff_id']::TEXT[], 'Foreign key dvdrental.payment.payment_staff_id_fk should exist.');

  SELECT * FROM finish();
ROLLBACK;
