BEGIN;
  SELECT plan(8);

  SELECT has_schema('dvdrental', 'Schema dvdrental should exist.');

  SELECT has_table('dvdrental', 'language', 'Table dvdrental.language should exist.');

  SELECT has_column('dvdrental', 'language', 'language_id', 'Column dvdrental.language.language_id should exist.');

  SELECT has_role('dbo', 'Role dbo should exist.');

  SELECT index_owner_is('dvdrental', 'language', 'language_pk', 'dbo', 'Index dvdrental.language.language_pk should have the correct owner.');

  SELECT index_is_primary('dvdrental', 'language', 'language_pk', 'Index dvdrental.language.language_pk should be a primary key index.');

  SELECT index_is_unique('dvdrental', 'language', 'language_pk', 'Index dvdrental.language.language_pk should be a unique index.');

  SELECT index_is_type('dvdrental', 'language', 'language_pk', 'btree', 'Index dvdrental.language.language_pk should be of the correct type.');

  SELECT * FROM finish();
ROLLBACK;
