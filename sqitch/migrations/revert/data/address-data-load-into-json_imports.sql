-- Revert dvdrental:data/language-data-load-into-json_imports from pg

BEGIN;

TRUNCATE TABLE dsa.json_imports;

COMMIT;
