BEGIN;
  SELECT plan(7);

  SELECT has_schema('dvdrental', 'Schema dvdrental should exist.');

  SELECT has_table('dvdrental', 'inventory', 'Table dvdrental.inventory should exist.');

  SELECT has_column('dvdrental', 'inventory', 'film_id', 'Column dvdrental.inventory.film_id should exist.');

  SELECT has_schema('dvdrental', 'Schema dvdrental should exist.');

  SELECT has_table('dvdrental', 'film', 'Table dvdrental.film should exist.');

  SELECT has_column('dvdrental', 'film', 'film_id', 'Column dvdrental.film.film_id should exist.');

  SELECT fk_ok('dvdrental', 'inventory', ARRAY['film_id']::TEXT[], 'dvdrental', 'film', ARRAY['film_id']::TEXT[], 'Foreign key dvdrental.inventory.inventory_film_id_fk should exist.');

  SELECT * FROM finish();
ROLLBACK;
