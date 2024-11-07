BEGIN;
  SELECT plan(7);

  SELECT has_schema('dvdrental', 'Schema dvdrental should exist.');

  SELECT has_table('dvdrental', 'inventory', 'Table dvdrental.inventory should exist.');

  SELECT has_column('dvdrental', 'inventory', 'store_id', 'Column dvdrental.inventory.store_id should exist.');

  SELECT has_column('dvdrental', 'inventory', 'film_id', 'Column dvdrental.inventory.film_id should exist.');

  SELECT has_role('dbo', 'Role dbo should exist.');

  SELECT index_owner_is('dvdrental', 'inventory', 'inventory_store_id_film_id_idx', 'dbo', 'Index dvdrental.inventory.inventory_store_id_film_id_idx should have the correct owner.');

  SELECT index_is_type('dvdrental', 'inventory', 'inventory_store_id_film_id_idx', 'btree', 'Index dvdrental.inventory.inventory_store_id_film_id_idx should be of the correct type.');

  SELECT * FROM finish();
ROLLBACK;
