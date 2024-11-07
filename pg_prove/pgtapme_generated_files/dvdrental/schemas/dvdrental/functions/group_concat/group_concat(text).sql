BEGIN;
  SELECT plan(13);

  SELECT has_schema('dvdrental', 'Schema dvdrental should exist.');

  SELECT has_function('dvdrental', 'group_concat', ARRAY['text']::TEXT[], 'Function dvdrental.None should exist.');

  SELECT has_role('dbo', 'Role dbo should exist.');

  SELECT function_owner_is('dvdrental', 'group_concat', ARRAY['text']::TEXT[], 'dbo', 'Function dvdrental.group_concat(text) should have the correct owner.');

  SELECT function_lang_is('dvdrental', 'group_concat', ARRAY['text']::TEXT[], 'internal', 'Function dvdrental.group_concat(text) should have the correct language.');

  SELECT function_returns('dvdrental', 'group_concat', ARRAY['text']::TEXT[], 'text', 'Function dvdrental.group_concat(text) should have the correct return type.');

  SELECT isnt_definer('dvdrental', 'group_concat', ARRAY['text']::TEXT[], 'Function dvdrental.group_concat(text) should have the correct security invoker.');

  SELECT isnt_strict('dvdrental', 'group_concat', ARRAY['text']::TEXT[], 'Function dvdrental.group_concat(text) should not be strict.');

  SELECT isnt_normal_function('dvdrental', 'group_concat', ARRAY['text']::TEXT[], 'Function dvdrental.group_concat(text) should not be a normal function.');

  SELECT is_aggregate('dvdrental', 'group_concat', ARRAY['text']::TEXT[], 'Function dvdrental.group_concat(text) should be an aggregate function.');

  SELECT isnt_window('dvdrental', 'group_concat', ARRAY['text']::TEXT[], 'Function dvdrental.group_concat(text) should not be a window function.');

  SELECT isnt_procedure('dvdrental', 'group_concat', ARRAY['text']::TEXT[], 'Function dvdrental.group_concat(text) should not be a procedure.');

  SELECT volatility_is('dvdrental', 'group_concat', ARRAY['text']::TEXT[], 'i', 'Function dvdrental.group_concat(text) should have the correct volatility.');

  SELECT * FROM finish();
ROLLBACK;
