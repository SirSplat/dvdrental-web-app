BEGIN;
  SELECT plan(8);

  SELECT has_schema('dvdrental', 'Schema dvdrental should exist.');

  SELECT has_table('dvdrental', 'dvdrental', 'Table dvdrental.rental should exist.');

  SELECT has_column('dvdrental', 'dvdrental', 'rental_id', 'Column dvdrental.rental.rental_id should exist.');

  SELECT has_role('dbo', 'Role dbo should exist.');

  SELECT index_owner_is('dvdrental', 'dvdrental', 'rental_pk', 'dbo', 'Index dvdrental.rental.rental_pk should have the correct owner.');

  SELECT index_is_primary('dvdrental', 'dvdrental', 'rental_pk', 'Index dvdrental.rental.rental_pk should be a primary key index.');

  SELECT index_is_unique('dvdrental', 'dvdrental', 'rental_pk', 'Index dvdrental.rental.rental_pk should be a unique index.');

  SELECT index_is_type('dvdrental', 'dvdrental', 'rental_pk', 'btree', 'Index dvdrental.rental.rental_pk should be of the correct type.');

  SELECT * FROM finish();
ROLLBACK;
