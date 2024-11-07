BEGIN;
  SELECT plan(9);

  SELECT has_schema('dvdrental', 'Schema dvdrental should exist.');

  SELECT has_table('dvdrental', 'dvdrental', 'Table dvdrental.rental should exist.');

  SELECT has_column('dvdrental', 'dvdrental', 'rental_date', 'Column dvdrental.rental.rental_date should exist.');

  SELECT has_column('dvdrental', 'dvdrental', 'inventory_id', 'Column dvdrental.rental.inventory_id should exist.');

  SELECT has_column('dvdrental', 'dvdrental', 'customer_id', 'Column dvdrental.rental.customer_id should exist.');

  SELECT has_role('dbo', 'Role dbo should exist.');

  SELECT index_owner_is('dvdrental', 'dvdrental', 'rental_rental_date_inventory_id_customer_id_uidx', 'dbo', 'Index dvdrental.rental.rental_rental_date_inventory_id_customer_id_uidx should have the correct owner.');

  SELECT index_is_unique('dvdrental', 'dvdrental', 'rental_rental_date_inventory_id_customer_id_uidx', 'Index dvdrental.rental.rental_rental_date_inventory_id_customer_id_uidx should be a unique index.');

  SELECT index_is_type('dvdrental', 'dvdrental', 'rental_rental_date_inventory_id_customer_id_uidx', 'btree', 'Index dvdrental.rental.rental_rental_date_inventory_id_customer_id_uidx should be of the correct type.');

  SELECT * FROM finish();
ROLLBACK;
