BEGIN;
  SELECT plan(6);

  SELECT has_schema('dvdrental', 'Schema dvdrental should exist.');

  SELECT has_table('dvdrental', 'film_category', 'Table dvdrental.film_category should exist.');

  SELECT has_schema('dvdrental', 'Schema dvdrental should exist.');

  SELECT has_function('dvdrental', 'last_updated_trg_func', ARRAY[]::TEXT[], 'Function dvdrental.None should exist.');

  SELECT has_trigger('dvdrental', 'film_category', 'last_updated_trg', 'Trigger dvdrental.film_category.last_updated_trg should exist.');

  SELECT trigger_is('dvdrental', 'film_category', 'last_updated_trg', 'dvdrental', 'last_updated_trg_func', 'Trigger dvdrental.film_category.last_updated_trg should exist.');

  SELECT * FROM finish();
ROLLBACK;
