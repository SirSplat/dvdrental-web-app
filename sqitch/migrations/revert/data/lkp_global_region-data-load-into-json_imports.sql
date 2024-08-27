-- Revert dvdrental:data/lkp_global_region from pg

BEGIN;

TRUNCATE dsa.json_imports;

COMMIT;
