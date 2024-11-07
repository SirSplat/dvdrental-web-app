BEGIN;
  SELECT plan(13);

  SELECT has_schema('dvdrental', 'Schema dvdrental should exist.');

  SELECT has_function('dvdrental', 'film_in_stock', ARRAY['integer', 'integer']::TEXT[], 'Function dvdrental.None should exist.');

  SELECT has_role('dbo', 'Role dbo should exist.');

  SELECT function_owner_is('dvdrental', 'film_in_stock', ARRAY['integer', 'integer']::TEXT[], 'dbo', 'Function dvdrental.film_in_stock(integer_integer) should have the correct owner.');

  SELECT function_lang_is('dvdrental', 'film_in_stock', ARRAY['integer', 'integer']::TEXT[], 'sql', 'Function dvdrental.film_in_stock(integer_integer) should have the correct language.');

  SELECT function_returns('dvdrental', 'film_in_stock', ARRAY['integer', 'integer']::TEXT[], 'setof integer', 'Function dvdrental.film_in_stock(integer_integer) should have the correct return type.');

  SELECT isnt_definer('dvdrental', 'film_in_stock', ARRAY['integer', 'integer']::TEXT[], 'Function dvdrental.film_in_stock(integer_integer) should have the correct security invoker.');

  SELECT isnt_strict('dvdrental', 'film_in_stock', ARRAY['integer', 'integer']::TEXT[], 'Function dvdrental.film_in_stock(integer_integer) should not be strict.');

  SELECT is_normal_function('dvdrental', 'film_in_stock', ARRAY['integer', 'integer']::TEXT[], 'Function dvdrental.film_in_stock(integer_integer) should be a normal function.');

  SELECT isnt_aggregate('dvdrental', 'film_in_stock', ARRAY['integer', 'integer']::TEXT[], 'Function dvdrental.film_in_stock(integer_integer) should not be an aggregate function.');

  SELECT isnt_window('dvdrental', 'film_in_stock', ARRAY['integer', 'integer']::TEXT[], 'Function dvdrental.film_in_stock(integer_integer) should not be a window function.');

  SELECT isnt_procedure('dvdrental', 'film_in_stock', ARRAY['integer', 'integer']::TEXT[], 'Function dvdrental.film_in_stock(integer_integer) should not be a procedure.');

  SELECT volatility_is('dvdrental', 'film_in_stock', ARRAY['integer', 'integer']::TEXT[], 'v', 'Function dvdrental.film_in_stock(integer_integer) should have the correct volatility.');

  SELECT * FROM finish();
ROLLBACK;
