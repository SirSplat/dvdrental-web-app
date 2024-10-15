-- Verify dvdrental:functions/address-etl-from-json_imports on pg

BEGIN;

SELECT pg_catalog.has_function_privilege( current_user, 'dsa.address_etl_from_json_imports()', 'execute' );

ROLLBACK;
