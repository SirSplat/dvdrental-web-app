-- Revert dvdrental:functions/country-etl-from-json_imports from pg

BEGIN;

DROP FUNCTION dsa.country_etl_from_json_imports();

COMMIT;
