-- Revert dvdrental:functions/lkp_global_subregion-etl-from-json_imports from pg

BEGIN;

DROP FUNCTION dsa.lkp_global_subregion_etl_from_json_imports();

COMMIT;
