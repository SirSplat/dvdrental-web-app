BEGIN;
  SELECT plan(9);

  SELECT has_schema('dvdrental', 'Schema dvdrental should exist.');

  SELECT has_table('dvdrental', 'film_category', 'Table dvdrental.film_category should exist.');

  SELECT has_column('dvdrental', 'film_category', 'film_id', 'Column dvdrental.film_category.film_id should exist.');

  SELECT has_column('dvdrental', 'film_category', 'category_id', 'Column dvdrental.film_category.category_id should exist.');

  SELECT has_role('dbo', 'Role dbo should exist.');

  SELECT index_owner_is('dvdrental', 'film_category', 'film_category_pk', 'dbo', 'Index dvdrental.film_category.film_category_pk should have the correct owner.');

  SELECT index_is_primary('dvdrental', 'film_category', 'film_category_pk', 'Index dvdrental.film_category.film_category_pk should be a primary key index.');

  SELECT index_is_unique('dvdrental', 'film_category', 'film_category_pk', 'Index dvdrental.film_category.film_category_pk should be a unique index.');

  SELECT index_is_type('dvdrental', 'film_category', 'film_category_pk', 'btree', 'Index dvdrental.film_category.film_category_pk should be of the correct type.');

  SELECT * FROM finish();
ROLLBACK;
