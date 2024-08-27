-- Revert dvdrental:data/city-execute-populate-function-data-into-json_imports from pg

BEGIN;

TRUNCATE TABLE dsa.json_imports;

COMMIT;
