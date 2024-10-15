-- Revert dvdrental:tables/json_imports from pg

BEGIN;

DROP TABLE dsa.json_imports;

COMMIT;
