BEGIN;
  SELECT plan(13);

  SELECT has_schema('dvdrental', 'Schema dvdrental should exist.');

  SELECT has_function('dvdrental', 'rewards_report', ARRAY['integer', 'numeric']::TEXT[], 'Function dvdrental.None should exist.');

  SELECT has_role('dbo', 'Role dbo should exist.');

  SELECT function_owner_is('dvdrental', 'rewards_report', ARRAY['integer', 'numeric']::TEXT[], 'dbo', 'Function dvdrental.rewards_report(integer_numeric) should have the correct owner.');

  SELECT function_lang_is('dvdrental', 'rewards_report', ARRAY['integer', 'numeric']::TEXT[], 'plpgsql', 'Function dvdrental.rewards_report(integer_numeric) should have the correct language.');

  SELECT function_returns('dvdrental', 'rewards_report', ARRAY['integer', 'numeric']::TEXT[], 'setof customer', 'Function dvdrental.rewards_report(integer_numeric) should have the correct return type.');

  SELECT is_definer('dvdrental', 'rewards_report', ARRAY['integer', 'numeric']::TEXT[], 'Function dvdrental.rewards_report(integer_numeric) should have the correct security definer.');

  SELECT isnt_strict('dvdrental', 'rewards_report', ARRAY['integer', 'numeric']::TEXT[], 'Function dvdrental.rewards_report(integer_numeric) should not be strict.');

  SELECT is_normal_function('dvdrental', 'rewards_report', ARRAY['integer', 'numeric']::TEXT[], 'Function dvdrental.rewards_report(integer_numeric) should be a normal function.');

  SELECT isnt_aggregate('dvdrental', 'rewards_report', ARRAY['integer', 'numeric']::TEXT[], 'Function dvdrental.rewards_report(integer_numeric) should not be an aggregate function.');

  SELECT isnt_window('dvdrental', 'rewards_report', ARRAY['integer', 'numeric']::TEXT[], 'Function dvdrental.rewards_report(integer_numeric) should not be a window function.');

  SELECT isnt_procedure('dvdrental', 'rewards_report', ARRAY['integer', 'numeric']::TEXT[], 'Function dvdrental.rewards_report(integer_numeric) should not be a procedure.');

  SELECT volatility_is('dvdrental', 'rewards_report', ARRAY['integer', 'numeric']::TEXT[], 'v', 'Function dvdrental.rewards_report(integer_numeric) should have the correct volatility.');

  SELECT * FROM finish();
ROLLBACK;
