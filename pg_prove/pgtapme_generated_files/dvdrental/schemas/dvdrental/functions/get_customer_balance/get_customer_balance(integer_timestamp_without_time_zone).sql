BEGIN;
  SELECT plan(13);

  SELECT has_schema('dvdrental', 'Schema dvdrental should exist.');

  SELECT has_function('dvdrental', 'get_customer_balance', ARRAY['integer', 'timestamp without time zone']::TEXT[], 'Function dvdrental.None should exist.');

  SELECT has_role('dbo', 'Role dbo should exist.');

  SELECT function_owner_is('dvdrental', 'get_customer_balance', ARRAY['integer', 'timestamp without time zone']::TEXT[], 'dbo', 'Function dvdrental.get_customer_balance(integer_timestamp_without_time_zone) should have the correct owner.');

  SELECT function_lang_is('dvdrental', 'get_customer_balance', ARRAY['integer', 'timestamp without time zone']::TEXT[], 'plpgsql', 'Function dvdrental.get_customer_balance(integer_timestamp_without_time_zone) should have the correct language.');

  SELECT function_returns('dvdrental', 'get_customer_balance', ARRAY['integer', 'timestamp without time zone']::TEXT[], 'numeric', 'Function dvdrental.get_customer_balance(integer_timestamp_without_time_zone) should have the correct return type.');

  SELECT isnt_definer('dvdrental', 'get_customer_balance', ARRAY['integer', 'timestamp without time zone']::TEXT[], 'Function dvdrental.get_customer_balance(integer_timestamp_without_time_zone) should have the correct security invoker.');

  SELECT isnt_strict('dvdrental', 'get_customer_balance', ARRAY['integer', 'timestamp without time zone']::TEXT[], 'Function dvdrental.get_customer_balance(integer_timestamp_without_time_zone) should not be strict.');

  SELECT is_normal_function('dvdrental', 'get_customer_balance', ARRAY['integer', 'timestamp without time zone']::TEXT[], 'Function dvdrental.get_customer_balance(integer_timestamp_without_time_zone) should be a normal function.');

  SELECT isnt_aggregate('dvdrental', 'get_customer_balance', ARRAY['integer', 'timestamp without time zone']::TEXT[], 'Function dvdrental.get_customer_balance(integer_timestamp_without_time_zone) should not be an aggregate function.');

  SELECT isnt_window('dvdrental', 'get_customer_balance', ARRAY['integer', 'timestamp without time zone']::TEXT[], 'Function dvdrental.get_customer_balance(integer_timestamp_without_time_zone) should not be a window function.');

  SELECT isnt_procedure('dvdrental', 'get_customer_balance', ARRAY['integer', 'timestamp without time zone']::TEXT[], 'Function dvdrental.get_customer_balance(integer_timestamp_without_time_zone) should not be a procedure.');

  SELECT volatility_is('dvdrental', 'get_customer_balance', ARRAY['integer', 'timestamp without time zone']::TEXT[], 'v', 'Function dvdrental.get_customer_balance(integer_timestamp_without_time_zone) should have the correct volatility.');

  SELECT * FROM finish();
ROLLBACK;
