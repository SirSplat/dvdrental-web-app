-- Revert dvdrental:tables/country from pg

BEGIN;

DROP TABLE dvdrental.country;

COMMIT;
