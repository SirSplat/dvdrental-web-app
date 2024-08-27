-- Revert dvdrental:data/global_subregion-execute-etl-from-json_imports from pg

BEGIN;

TRUNCATE TABLE dsa.global_subregion;

COMMIT;
