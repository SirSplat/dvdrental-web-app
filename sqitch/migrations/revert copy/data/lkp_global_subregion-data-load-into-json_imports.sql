-- Revert dvdrental:data/lkp_global_subregion from pg

BEGIN;

TRUNCATE dsa.json_imports;

COMMIT;
