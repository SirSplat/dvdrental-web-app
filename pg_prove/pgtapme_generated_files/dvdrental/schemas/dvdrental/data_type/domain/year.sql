BEGIN;
  SELECT plan(6);

  SELECT has_schema('dvdrental', 'Schema dvdrental should exist.');

  SELECT has_domain('dvdrental', 'year', 'Domain dvdrental.year should exist.');

  SELECT has_role('dbo', 'Role dbo should exist.');

  SELECT type_owner_is('dvdrental', 'year', 'dbo', 'Type dvdrental.year should have the correct owner.');

  SELECT has_schema('pg_catalog', 'Schema pg_catalog should exist.');

  SELECT domain_type_is('dvdrental', 'year', 'pg_catalog', 'integer', 'Domain dvdrental.year should have the correct type.');

  SELECT * FROM finish();
ROLLBACK;
