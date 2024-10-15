-- Revert dvdrental:functions/address-etl-from-json_imports from pg

BEGIN;

DROP FUNCTION dsa.address_etl_from_json_imports();

COMMIT;
