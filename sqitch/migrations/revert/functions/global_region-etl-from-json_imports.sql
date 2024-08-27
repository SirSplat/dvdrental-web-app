-- Revert dvdrental:functions/global_region-etl-from-json_imports from pg

BEGIN;

DROP FUNCTION dsa.global_region_etl_from_json_imports();

COMMIT;
