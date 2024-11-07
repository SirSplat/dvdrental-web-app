BEGIN;
  SELECT plan(6);

  SELECT has_schema('dvdrental', 'Schema dvdrental should exist.');

  SELECT has_table('dvdrental', 'film_actor', 'Table dvdrental.film_actor should exist.');

  SELECT has_schema('dvdrental', 'Schema dvdrental should exist.');

  SELECT has_function('dvdrental', 'last_updated_trg_func', ARRAY[]::TEXT[], 'Function dvdrental.None should exist.');

  SELECT has_trigger('dvdrental', 'film_actor', 'last_updated_trg', 'Trigger dvdrental.film_actor.last_updated_trg should exist.');

  SELECT trigger_is('dvdrental', 'film_actor', 'last_updated_trg', 'dvdrental', 'last_updated_trg_func', 'Trigger dvdrental.film_actor.last_updated_trg should exist.');

  SELECT * FROM finish();
ROLLBACK;
