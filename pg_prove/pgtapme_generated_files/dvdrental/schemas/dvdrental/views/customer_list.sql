BEGIN;
  SELECT plan(4);

  SELECT has_schema('dvdrental', 'Schema dvdrental should exist.');

  SELECT has_view('dvdrental', 'customer_list', 'View dvdrental.customer_list should exist.');

  SELECT has_role('dbo', 'Role dbo should exist.');

  SELECT view_owner_is('dvdrental', 'customer_list', 'dbo', 'View dvdrental.customer_list should have the correct owner.');

  SELECT * FROM finish();
ROLLBACK;
