-- Revert dvdrental:data/global_sub_region from pg

BEGIN;

TRUNCATE dsa.json_imports;

COMMIT;
