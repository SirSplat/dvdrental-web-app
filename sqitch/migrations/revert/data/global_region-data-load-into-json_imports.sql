-- Revert dvdrental:data/global_region from pg

BEGIN;

TRUNCATE dsa.json_imports;

COMMIT;
