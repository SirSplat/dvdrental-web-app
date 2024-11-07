BEGIN;
  SELECT plan(4);

  SELECT has_schema('dvdrental', 'Schema dvdrental should exist.');

  SELECT has_view('dvdrental', 'sales_by_store', 'View dvdrental.sales_by_store should exist.');

  SELECT has_role('dbo', 'Role dbo should exist.');

  SELECT view_owner_is('dvdrental', 'sales_by_store', 'dbo', 'View dvdrental.sales_by_store should have the correct owner.');

  SELECT * FROM finish();
ROLLBACK;
