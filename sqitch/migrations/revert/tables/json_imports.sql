-- Revert dvdrental:tables/json_imports from pg

BEGIN;

DROP TABLE rental.json_imports;

COMMIT;
