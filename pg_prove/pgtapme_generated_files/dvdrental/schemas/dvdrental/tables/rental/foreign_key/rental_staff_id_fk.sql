BEGIN;
  SELECT plan(7);

  SELECT has_schema('dvdrental', 'Schema dvdrental should exist.');

  SELECT has_table('dvdrental', 'dvdrental', 'Table dvdrental.rental should exist.');

  SELECT has_column('dvdrental', 'dvdrental', 'staff_id', 'Column dvdrental.rental.staff_id should exist.');

  SELECT has_schema('dvdrental', 'Schema dvdrental should exist.');

  SELECT has_table('dvdrental', 'staff', 'Table dvdrental.staff should exist.');

  SELECT has_column('dvdrental', 'staff', 'staff_id', 'Column dvdrental.staff.staff_id should exist.');

  SELECT fk_ok('dvdrental', 'dvdrental', ARRAY['staff_id']::TEXT[], 'dvdrental', 'staff', ARRAY['staff_id']::TEXT[], 'Foreign key dvdrental.rental.rental_staff_id_fk should exist.');

  SELECT * FROM finish();
ROLLBACK;
