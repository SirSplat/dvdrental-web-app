-- Revert dvdrental:data/global_region-execute-etl-from-json_imports from pg

BEGIN;

TRUNCATE TABLE dsa.global_region;

COMMIT;
