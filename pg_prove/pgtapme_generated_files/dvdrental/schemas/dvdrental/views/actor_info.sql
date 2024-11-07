BEGIN;
  SELECT plan(4);

  SELECT has_schema('dvdrental', 'Schema dvdrental should exist.');

  SELECT has_view('dvdrental', 'actor_info', 'View dvdrental.actor_info should exist.');

  SELECT has_role('dbo', 'Role dbo should exist.');

  SELECT view_owner_is('dvdrental', 'actor_info', 'dbo', 'View dvdrental.actor_info should have the correct owner.');

  SELECT * FROM finish();
ROLLBACK;
