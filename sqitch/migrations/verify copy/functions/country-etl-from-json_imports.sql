-- Verify dvdrental:functions/country-etl-from-json_imports on pg

BEGIN;

SELECT pg_catalog.has_function_privilege( current_user, 'dsa.country_etl_from_json_imports()', 'execute' );

ROLLBACK;
