-- Revert dvdrental:data/global_sub_region-execute-etl-from-json_imports from pg

BEGIN;

TRUNCATE TABLE dsa.global_sub_region;

COMMIT;
