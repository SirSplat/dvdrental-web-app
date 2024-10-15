-- Revert dvdrental:functions/city-etl-from-json_imports from pg

BEGIN;

DROP FUNCTION dsa.city_etl_from_json_imports();

COMMIT;
