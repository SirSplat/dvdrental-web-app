BEGIN;
  SELECT plan(13);

  SELECT has_schema('dvdrental', 'Schema dvdrental should exist.');

  SELECT has_function('dvdrental', 'inventory_in_stock', ARRAY['integer']::TEXT[], 'Function dvdrental.None should exist.');

  SELECT has_role('dbo', 'Role dbo should exist.');

  SELECT function_owner_is('dvdrental', 'inventory_in_stock', ARRAY['integer']::TEXT[], 'dbo', 'Function dvdrental.inventory_in_stock(integer) should have the correct owner.');

  SELECT function_lang_is('dvdrental', 'inventory_in_stock', ARRAY['integer']::TEXT[], 'plpgsql', 'Function dvdrental.inventory_in_stock(integer) should have the correct language.');

  SELECT function_returns('dvdrental', 'inventory_in_stock', ARRAY['integer']::TEXT[], 'boolean', 'Function dvdrental.inventory_in_stock(integer) should have the correct return type.');

  SELECT isnt_definer('dvdrental', 'inventory_in_stock', ARRAY['integer']::TEXT[], 'Function dvdrental.inventory_in_stock(integer) should have the correct security invoker.');

  SELECT isnt_strict('dvdrental', 'inventory_in_stock', ARRAY['integer']::TEXT[], 'Function dvdrental.inventory_in_stock(integer) should not be strict.');

  SELECT is_normal_function('dvdrental', 'inventory_in_stock', ARRAY['integer']::TEXT[], 'Function dvdrental.inventory_in_stock(integer) should be a normal function.');

  SELECT isnt_aggregate('dvdrental', 'inventory_in_stock', ARRAY['integer']::TEXT[], 'Function dvdrental.inventory_in_stock(integer) should not be an aggregate function.');

  SELECT isnt_window('dvdrental', 'inventory_in_stock', ARRAY['integer']::TEXT[], 'Function dvdrental.inventory_in_stock(integer) should not be a window function.');

  SELECT isnt_procedure('dvdrental', 'inventory_in_stock', ARRAY['integer']::TEXT[], 'Function dvdrental.inventory_in_stock(integer) should not be a procedure.');

  SELECT volatility_is('dvdrental', 'inventory_in_stock', ARRAY['integer']::TEXT[], 'v', 'Function dvdrental.inventory_in_stock(integer) should have the correct volatility.');

  SELECT * FROM finish();
ROLLBACK;
