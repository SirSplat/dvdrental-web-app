BEGIN;
  SELECT plan(4);

  SELECT has_schema('dvdrental', 'Schema dvdrental should exist.');

  SELECT has_view('dvdrental', 'staff_list', 'View dvdrental.staff_list should exist.');

  SELECT has_role('dbo', 'Role dbo should exist.');

  SELECT view_owner_is('dvdrental', 'staff_list', 'dbo', 'View dvdrental.staff_list should have the correct owner.');

  SELECT * FROM finish();
ROLLBACK;
