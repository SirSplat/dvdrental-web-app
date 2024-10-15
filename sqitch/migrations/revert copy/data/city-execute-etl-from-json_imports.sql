-- Revert dvdrental:data/city-execute-etl-from-json_imports from pg

BEGIN;

TRUNCATE TABLE rental.city;

COMMIT;