BEGIN;
  SELECT plan(7);

  SELECT has_schema('dvdrental', 'Schema dvdrental should exist.');

  SELECT has_table('dvdrental', 'dvdrental', 'Table dvdrental.rental should exist.');

  SELECT has_column('dvdrental', 'dvdrental', 'inventory_id', 'Column dvdrental.rental.inventory_id should exist.');

  SELECT has_schema('dvdrental', 'Schema dvdrental should exist.');

  SELECT has_table('dvdrental', 'inventory', 'Table dvdrental.inventory should exist.');

  SELECT has_column('dvdrental', 'inventory', 'inventory_id', 'Column dvdrental.inventory.inventory_id should exist.');

  SELECT fk_ok('dvdrental', 'dvdrental', ARRAY['inventory_id']::TEXT[], 'dvdrental', 'inventory', ARRAY['inventory_id']::TEXT[], 'Foreign key dvdrental.rental.rental_inventory_id_fk should exist.');

  SELECT * FROM finish();
ROLLBACK;
