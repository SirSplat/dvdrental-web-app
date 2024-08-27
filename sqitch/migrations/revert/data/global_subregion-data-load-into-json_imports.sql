-- Revert dvdrental:data/global_subregion from pg

BEGIN;

TRUNCATE dsa.json_imports;

COMMIT;
