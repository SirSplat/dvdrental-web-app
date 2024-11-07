BEGIN;
  SELECT plan(13);

  SELECT has_schema('dvdrental', 'Schema dvdrental should exist.');

  SELECT has_function('dvdrental', '_group_concat', ARRAY['text', 'text']::TEXT[], 'Function dvdrental.None should exist.');

  SELECT has_role('dbo', 'Role dbo should exist.');

  SELECT function_owner_is('dvdrental', '_group_concat', ARRAY['text', 'text']::TEXT[], 'dbo', 'Function dvdrental._group_concat(text_text) should have the correct owner.');

  SELECT function_lang_is('dvdrental', '_group_concat', ARRAY['text', 'text']::TEXT[], 'sql', 'Function dvdrental._group_concat(text_text) should have the correct language.');

  SELECT function_returns('dvdrental', '_group_concat', ARRAY['text', 'text']::TEXT[], 'text', 'Function dvdrental._group_concat(text_text) should have the correct return type.');

  SELECT isnt_definer('dvdrental', '_group_concat', ARRAY['text', 'text']::TEXT[], 'Function dvdrental._group_concat(text_text) should have the correct security invoker.');

  SELECT isnt_strict('dvdrental', '_group_concat', ARRAY['text', 'text']::TEXT[], 'Function dvdrental._group_concat(text_text) should not be strict.');

  SELECT is_normal_function('dvdrental', '_group_concat', ARRAY['text', 'text']::TEXT[], 'Function dvdrental._group_concat(text_text) should be a normal function.');

  SELECT isnt_aggregate('dvdrental', '_group_concat', ARRAY['text', 'text']::TEXT[], 'Function dvdrental._group_concat(text_text) should not be an aggregate function.');

  SELECT isnt_window('dvdrental', '_group_concat', ARRAY['text', 'text']::TEXT[], 'Function dvdrental._group_concat(text_text) should not be a window function.');

  SELECT isnt_procedure('dvdrental', '_group_concat', ARRAY['text', 'text']::TEXT[], 'Function dvdrental._group_concat(text_text) should not be a procedure.');

  SELECT volatility_is('dvdrental', '_group_concat', ARRAY['text', 'text']::TEXT[], 'i', 'Function dvdrental._group_concat(text_text) should have the correct volatility.');

  SELECT * FROM finish();
ROLLBACK;
