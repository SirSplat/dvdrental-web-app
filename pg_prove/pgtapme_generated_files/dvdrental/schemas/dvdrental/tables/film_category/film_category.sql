BEGIN;
  SELECT plan(18);

  SELECT has_schema('dvdrental', 'Schema dvdrental should exist.');

  SELECT has_table('dvdrental', 'film_category', 'Table dvdrental.film_category should exist.');

  SELECT has_role('dbo', 'Role dbo should exist.');

  SELECT table_owner_is('dvdrental', 'film_category', 'dbo', 'Table dvdrental.film_category should have the correct owner.');

  SELECT partitions_are('dvdrental', 'film_category', ARRAY[]::TEXT[], 'Table dvdrental.film_category should have the correct partitions.');

  SELECT columns_are('dvdrental', 'film_category', ARRAY['film_id', 'category_id', 'last_update']::TEXT[], 'Table dvdrental.film_category should have the correct columns.');

  SELECT indexes_are('dvdrental', 'film_category', ARRAY['film_category_pk']::TEXT[], 'Table dvdrental.film_category should have the correct indexes.');

  SELECT triggers_are('dvdrental', 'film_category', ARRAY['last_updated_trg']::TEXT[], 'Table dvdrental.film_category should have the correct triggers.');

  SELECT rules_are('dvdrental', 'film_category', ARRAY[]::TEXT[], 'Table dvdrental.film_category should have the correct rules.');

  SELECT has_pk('dvdrental', 'film_category', 'Table dvdrental.film_category should have a primary key.');

  SELECT col_is_pk('dvdrental', 'film_category', ARRAY['film_id', 'category_id']::TEXT[], 'Table dvdrental.film_category should have the correct primary key columns.');

  SELECT col_isnt_pk('dvdrental', 'film_category', ARRAY['last_update']::TEXT[], 'Table dvdrental.film_category should have the correct primary key columns.');

  SELECT has_fk('dvdrental', 'film_category', 'Table dvdrental.film_category should have a foreign key.');

  SELECT col_is_fk('dvdrental', 'film_category', ARRAY['category_id']::TEXT[], 'Table dvdrental.film_category should have the correct foreign key columns.');

  SELECT col_is_fk('dvdrental', 'film_category', ARRAY['film_id']::TEXT[], 'Table dvdrental.film_category should have the correct foreign key columns.');

  SELECT col_isnt_fk('dvdrental', 'film_category', ARRAY['last_update']::TEXT[], 'Table dvdrental.film_category should have the correct foreign key columns.');

  SELECT isnt_partitioned('dvdrental', 'film_category', 'Table dvdrental.film_category should not be partitioned.');

  SELECT hasnt_inherited_tables('dvdrental', 'film_category', 'Table dvdrental.film_category should not have child tables.');

  SELECT * FROM finish();
ROLLBACK;
