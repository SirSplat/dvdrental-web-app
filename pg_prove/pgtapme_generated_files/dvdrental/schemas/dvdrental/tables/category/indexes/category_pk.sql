BEGIN;
  SELECT plan(8);

  SELECT has_schema('dvdrental', 'Schema dvdrental should exist.');

  SELECT has_table('dvdrental', 'category', 'Table dvdrental.category should exist.');

  SELECT has_column('dvdrental', 'category', 'category_id', 'Column dvdrental.category.category_id should exist.');

  SELECT has_role('dbo', 'Role dbo should exist.');

  SELECT index_owner_is('dvdrental', 'category', 'category_pk', 'dbo', 'Index dvdrental.category.category_pk should have the correct owner.');

  SELECT index_is_primary('dvdrental', 'category', 'category_pk', 'Index dvdrental.category.category_pk should be a primary key index.');

  SELECT index_is_unique('dvdrental', 'category', 'category_pk', 'Index dvdrental.category.category_pk should be a unique index.');

  SELECT index_is_type('dvdrental', 'category', 'category_pk', 'btree', 'Index dvdrental.category.category_pk should be of the correct type.');

  SELECT * FROM finish();
ROLLBACK;
