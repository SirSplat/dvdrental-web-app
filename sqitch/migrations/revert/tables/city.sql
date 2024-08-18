-- Revert dvdrental:tables/city from pg

BEGIN;

DROP TABLE rental.city;

COMMIT;
