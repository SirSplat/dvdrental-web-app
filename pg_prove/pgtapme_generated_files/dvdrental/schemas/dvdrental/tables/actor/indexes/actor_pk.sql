BEGIN;
  SELECT plan(8);

  SELECT has_schema('dvdrental', 'Schema dvdrental should exist.');

  SELECT has_table('dvdrental', 'actor', 'Table dvdrental.actor should exist.');

  SELECT has_column('dvdrental', 'actor', 'actor_id', 'Column dvdrental.actor.actor_id should exist.');

  SELECT has_role('dbo', 'Role dbo should exist.');

  SELECT index_owner_is('dvdrental', 'actor', 'actor_pk', 'dbo', 'Index dvdrental.actor.actor_pk should have the correct owner.');

  SELECT index_is_primary('dvdrental', 'actor', 'actor_pk', 'Index dvdrental.actor.actor_pk should be a primary key index.');

  SELECT index_is_unique('dvdrental', 'actor', 'actor_pk', 'Index dvdrental.actor.actor_pk should be a unique index.');

  SELECT index_is_type('dvdrental', 'actor', 'actor_pk', 'btree', 'Index dvdrental.actor.actor_pk should be of the correct type.');

  SELECT * FROM finish();
ROLLBACK;
