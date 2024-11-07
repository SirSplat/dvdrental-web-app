BEGIN;
  SELECT plan(5);

  SELECT has_schema('dvdrental', 'Schema dvdrental should exist.');

  SELECT has_role('dbo', 'Role dbo should exist.');

  SELECT type_owner_is('dvdrental', 'mpaa_rating', 'dbo', 'Type dvdrental.mpaa_rating should have the correct owner.');

  SELECT has_enum('dvdrental', 'mpaa_rating', 'ENUM dvdrental.mpaa_rating should exist.');

  SELECT enum_has_labels('dvdrental', 'mpaa_rating', ARRAY['G', 'PG', 'PG-13', 'R', 'NC-17']::TEXT[], 'ENUM dvdrental.mpaa_rating should have the correct labels.');

  SELECT * FROM finish();
ROLLBACK;
