-- Revert dvdrental:data/country-execute-etl-from-json_imports from pg

BEGIN;

TRUNCATE TABLE rental.country;

COMMIT;
