-- Revert dvdrental:functions/global_subregion-etl-from-json_imports from pg

BEGIN;

DROP FUNCTION dsa.global_subregion_etl_from_json_imports();

COMMIT;
