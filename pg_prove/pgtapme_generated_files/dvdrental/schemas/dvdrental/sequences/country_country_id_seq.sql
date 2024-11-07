BEGIN;
  SELECT plan(4);

  SELECT has_schema('dvdrental', 'Schema dvdrental should exist.');

  SELECT has_sequence('dvdrental', 'country_country_id_seq', 'Sequence dvdrental.country_country_id_seq should exist.');

  SELECT has_role('dbo', 'Role dbo should exist.');

  SELECT sequence_owner_is('dvdrental', 'country_country_id_seq', 'dbo', 'Sequence dvdrental.country_country_id_seq should have the correct owner.');

  SELECT * FROM finish();
ROLLBACK;
