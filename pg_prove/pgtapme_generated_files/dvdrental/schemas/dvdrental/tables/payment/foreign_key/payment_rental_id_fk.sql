BEGIN;
  SELECT plan(7);

  SELECT has_schema('dvdrental', 'Schema dvdrental should exist.');

  SELECT has_table('dvdrental', 'payment', 'Table dvdrental.payment should exist.');

  SELECT has_column('dvdrental', 'payment', 'rental_id', 'Column dvdrental.payment.rental_id should exist.');

  SELECT has_schema('dvdrental', 'Schema dvdrental should exist.');

  SELECT has_table('dvdrental', 'dvdrental', 'Table dvdrental.rental should exist.');

  SELECT has_column('dvdrental', 'dvdrental', 'rental_id', 'Column dvdrental.rental.rental_id should exist.');

  SELECT fk_ok('dvdrental', 'payment', ARRAY['rental_id']::TEXT[], 'dvdrental', 'dvdrental', ARRAY['rental_id']::TEXT[], 'Foreign key dvdrental.payment.payment_rental_id_fk should exist.');

  SELECT * FROM finish();
ROLLBACK;
