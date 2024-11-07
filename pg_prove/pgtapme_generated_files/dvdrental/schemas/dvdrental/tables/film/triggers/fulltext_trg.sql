BEGIN;
  SELECT plan(6);

  SELECT has_schema('dvdrental', 'Schema dvdrental should exist.');

  SELECT has_table('dvdrental', 'film', 'Table dvdrental.film should exist.');

  SELECT has_schema('pg_catalog', 'Schema pg_catalog should exist.');

  SELECT has_function('pg_catalog', 'tsvector_update_trigger', ARRAY[]::TEXT[], 'Function pg_catalog.None should exist.');

  SELECT has_trigger('dvdrental', 'film', 'fulltext_trg', 'Trigger dvdrental.film.fulltext_trg should exist.');

  SELECT trigger_is('dvdrental', 'film', 'fulltext_trg', 'pg_catalog', 'tsvector_update_trigger', 'Trigger dvdrental.film.fulltext_trg should exist.');

  SELECT * FROM finish();
ROLLBACK;
