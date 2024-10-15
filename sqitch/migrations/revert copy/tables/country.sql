-- Revert dvdrental:tables/country from pg

BEGIN;

DROP TABLE rental.country;

COMMIT;
