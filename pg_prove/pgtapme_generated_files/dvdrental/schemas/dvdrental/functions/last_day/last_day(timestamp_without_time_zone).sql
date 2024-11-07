BEGIN;
  SELECT plan(13);

  SELECT has_schema('dvdrental', 'Schema dvdrental should exist.');

  SELECT has_function('dvdrental', 'last_day', ARRAY['timestamp without time zone']::TEXT[], 'Function dvdrental.None should exist.');

  SELECT has_role('dbo', 'Role dbo should exist.');

  SELECT function_owner_is('dvdrental', 'last_day', ARRAY['timestamp without time zone']::TEXT[], 'dbo', 'Function dvdrental.last_day(timestamp_without_time_zone) should have the correct owner.');

  SELECT function_lang_is('dvdrental', 'last_day', ARRAY['timestamp without time zone']::TEXT[], 'sql', 'Function dvdrental.last_day(timestamp_without_time_zone) should have the correct language.');

  SELECT function_returns('dvdrental', 'last_day', ARRAY['timestamp without time zone']::TEXT[], 'date', 'Function dvdrental.last_day(timestamp_without_time_zone) should have the correct return type.');

  SELECT isnt_definer('dvdrental', 'last_day', ARRAY['timestamp without time zone']::TEXT[], 'Function dvdrental.last_day(timestamp_without_time_zone) should have the correct security invoker.');

  SELECT is_strict('dvdrental', 'last_day', ARRAY['timestamp without time zone']::TEXT[], 'Function dvdrental.last_day(timestamp_without_time_zone) should be strict.');

  SELECT is_normal_function('dvdrental', 'last_day', ARRAY['timestamp without time zone']::TEXT[], 'Function dvdrental.last_day(timestamp_without_time_zone) should be a normal function.');

  SELECT isnt_aggregate('dvdrental', 'last_day', ARRAY['timestamp without time zone']::TEXT[], 'Function dvdrental.last_day(timestamp_without_time_zone) should not be an aggregate function.');

  SELECT isnt_window('dvdrental', 'last_day', ARRAY['timestamp without time zone']::TEXT[], 'Function dvdrental.last_day(timestamp_without_time_zone) should not be a window function.');

  SELECT isnt_procedure('dvdrental', 'last_day', ARRAY['timestamp without time zone']::TEXT[], 'Function dvdrental.last_day(timestamp_without_time_zone) should not be a procedure.');

  SELECT volatility_is('dvdrental', 'last_day', ARRAY['timestamp without time zone']::TEXT[], 'i', 'Function dvdrental.last_day(timestamp_without_time_zone) should have the correct volatility.');

  SELECT * FROM finish();
ROLLBACK;
