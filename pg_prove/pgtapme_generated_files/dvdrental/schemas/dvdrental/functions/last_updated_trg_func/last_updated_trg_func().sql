BEGIN;
  SELECT plan(13);

  SELECT has_schema('dvdrental', 'Schema dvdrental should exist.');

  SELECT has_function('dvdrental', 'last_updated_trg_func', ARRAY[]::TEXT[], 'Function dvdrental.None should exist.');

  SELECT has_role('dbo', 'Role dbo should exist.');

  SELECT function_owner_is('dvdrental', 'last_updated_trg_func', ARRAY[]::TEXT[], 'dbo', 'Function dvdrental.() should have the correct owner.');

  SELECT function_lang_is('dvdrental', 'last_updated_trg_func', ARRAY[]::TEXT[], 'plpgsql', 'Function dvdrental.() should have the correct language.');

  SELECT function_returns('dvdrental', 'last_updated_trg_func', ARRAY[]::TEXT[], 'trigger', 'Function dvdrental.() should have the correct return type.');

  SELECT isnt_definer('dvdrental', 'last_updated_trg_func', ARRAY[]::TEXT[], 'Function dvdrental.() should have the correct security invoker.');

  SELECT isnt_strict('dvdrental', 'last_updated_trg_func', ARRAY[]::TEXT[], 'Function dvdrental.() should not be strict.');

  SELECT is_normal_function('dvdrental', 'last_updated_trg_func', ARRAY[]::TEXT[], 'Function dvdrental.() should be a normal function.');

  SELECT isnt_aggregate('dvdrental', 'last_updated_trg_func', ARRAY[]::TEXT[], 'Function dvdrental.() should not be an aggregate function.');

  SELECT isnt_window('dvdrental', 'last_updated_trg_func', ARRAY[]::TEXT[], 'Function dvdrental.() should not be a window function.');

  SELECT isnt_procedure('dvdrental', 'last_updated_trg_func', ARRAY[]::TEXT[], 'Function dvdrental.() should not be a procedure.');

  SELECT volatility_is('dvdrental', 'last_updated_trg_func', ARRAY[]::TEXT[], 'v', 'Function dvdrental.() should have the correct volatility.');

  SELECT * FROM finish();
ROLLBACK;
