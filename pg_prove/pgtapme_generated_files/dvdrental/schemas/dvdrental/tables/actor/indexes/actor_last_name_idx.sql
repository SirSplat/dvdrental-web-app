BEGIN;
  SELECT plan(6);

  SELECT has_schema('dvdrental', 'Schema dvdrental should exist.');

  SELECT has_table('dvdrental', 'actor', 'Table dvdrental.actor should exist.');

  SELECT has_column('dvdrental', 'actor', 'last_name', 'Column dvdrental.actor.last_name should exist.');

  SELECT has_role('dbo', 'Role dbo should exist.');

  SELECT index_owner_is('dvdrental', 'actor', 'actor_last_name_idx', 'dbo', 'Index dvdrental.actor.actor_last_name_idx should have the correct owner.');

  SELECT index_is_type('dvdrental', 'actor', 'actor_last_name_idx', 'btree', 'Index dvdrental.actor.actor_last_name_idx should be of the correct type.');

  SELECT * FROM finish();
ROLLBACK;
