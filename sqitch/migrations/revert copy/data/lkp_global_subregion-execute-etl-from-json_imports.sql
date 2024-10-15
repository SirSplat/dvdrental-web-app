-- Revert dvdrental:data/lkp_global_subregion-execute-etl-from-json_imports from pg

BEGIN;

TRUNCATE TABLE dsa.lkp_global_subregion;

COMMIT;
