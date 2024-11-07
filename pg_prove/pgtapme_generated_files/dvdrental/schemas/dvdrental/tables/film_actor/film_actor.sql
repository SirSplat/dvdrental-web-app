BEGIN;
  SELECT plan(18);

  SELECT has_schema('dvdrental', 'Schema dvdrental should exist.');

  SELECT has_table('dvdrental', 'film_actor', 'Table dvdrental.film_actor should exist.');

  SELECT has_role('dbo', 'Role dbo should exist.');

  SELECT table_owner_is('dvdrental', 'film_actor', 'dbo', 'Table dvdrental.film_actor should have the correct owner.');

  SELECT partitions_are('dvdrental', 'film_actor', ARRAY[]::TEXT[], 'Table dvdrental.film_actor should have the correct partitions.');

  SELECT columns_are('dvdrental', 'film_actor', ARRAY['actor_id', 'film_id', 'last_update']::TEXT[], 'Table dvdrental.film_actor should have the correct columns.');

  SELECT indexes_are('dvdrental', 'film_actor', ARRAY['film_actor_pk', 'film_actor_film_id_idx']::TEXT[], 'Table dvdrental.film_actor should have the correct indexes.');

  SELECT triggers_are('dvdrental', 'film_actor', ARRAY['last_updated_trg']::TEXT[], 'Table dvdrental.film_actor should have the correct triggers.');

  SELECT rules_are('dvdrental', 'film_actor', ARRAY[]::TEXT[], 'Table dvdrental.film_actor should have the correct rules.');

  SELECT has_pk('dvdrental', 'film_actor', 'Table dvdrental.film_actor should have a primary key.');

  SELECT col_is_pk('dvdrental', 'film_actor', ARRAY['actor_id', 'film_id']::TEXT[], 'Table dvdrental.film_actor should have the correct primary key columns.');

  SELECT col_isnt_pk('dvdrental', 'film_actor', ARRAY['last_update']::TEXT[], 'Table dvdrental.film_actor should have the correct primary key columns.');

  SELECT has_fk('dvdrental', 'film_actor', 'Table dvdrental.film_actor should have a foreign key.');

  SELECT col_is_fk('dvdrental', 'film_actor', ARRAY['actor_id']::TEXT[], 'Table dvdrental.film_actor should have the correct foreign key columns.');

  SELECT col_is_fk('dvdrental', 'film_actor', ARRAY['film_id']::TEXT[], 'Table dvdrental.film_actor should have the correct foreign key columns.');

  SELECT col_isnt_fk('dvdrental', 'film_actor', ARRAY['last_update']::TEXT[], 'Table dvdrental.film_actor should have the correct foreign key columns.');

  SELECT isnt_partitioned('dvdrental', 'film_actor', 'Table dvdrental.film_actor should not be partitioned.');

  SELECT hasnt_inherited_tables('dvdrental', 'film_actor', 'Table dvdrental.film_actor should not have child tables.');

  SELECT * FROM finish();
ROLLBACK;
