BEGIN;
  SELECT plan(4);

  SELECT has_schema('dvdrental', 'Schema dvdrental should exist.');

  SELECT has_view('dvdrental', 'sales_by_film_category', 'View dvdrental.sales_by_film_category should exist.');

  SELECT has_role('dbo', 'Role dbo should exist.');

  SELECT view_owner_is('dvdrental', 'sales_by_film_category', 'dbo', 'View dvdrental.sales_by_film_category should have the correct owner.');

  SELECT * FROM finish();
ROLLBACK;
