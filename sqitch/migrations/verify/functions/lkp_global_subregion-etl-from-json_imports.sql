-- Verify dvdrental:functions/lkp_global_subregion-etl-from-json_imports on pg

BEGIN;

SELECT pg_catalog.has_function_privilege( current_user, 'dsa.lkp_global_subregion_etl_from_json_imports()', 'execute' );

ROLLBACK;
