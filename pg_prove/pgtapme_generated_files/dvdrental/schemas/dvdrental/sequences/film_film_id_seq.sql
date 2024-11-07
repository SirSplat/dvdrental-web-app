BEGIN;
  SELECT plan(4);

  SELECT has_schema('dvdrental', 'Schema dvdrental should exist.');

  SELECT has_sequence('dvdrental', 'film_film_id_seq', 'Sequence dvdrental.film_film_id_seq should exist.');

  SELECT has_role('dbo', 'Role dbo should exist.');

  SELECT sequence_owner_is('dvdrental', 'film_film_id_seq', 'dbo', 'Sequence dvdrental.film_film_id_seq should have the correct owner.');

  SELECT * FROM finish();
ROLLBACK;
