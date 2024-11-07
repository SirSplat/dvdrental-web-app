BEGIN;
  SELECT plan(6);

  SELECT has_schema('dvdrental', 'Schema dvdrental should exist.');

  SELECT has_table('dvdrental', 'dvdrental', 'Table dvdrental.rental should exist.');

  SELECT has_column('dvdrental', 'dvdrental', 'inventory_id', 'Column dvdrental.rental.inventory_id should exist.');

  SELECT has_role('dbo', 'Role dbo should exist.');

  SELECT index_owner_is('dvdrental', 'dvdrental', 'rental_inventory_id_idx', 'dbo', 'Index dvdrental.rental.rental_inventory_id_idx should have the correct owner.');

  SELECT index_is_type('dvdrental', 'dvdrental', 'rental_inventory_id_idx', 'btree', 'Index dvdrental.rental.rental_inventory_id_idx should be of the correct type.');

  SELECT * FROM finish();
ROLLBACK;
