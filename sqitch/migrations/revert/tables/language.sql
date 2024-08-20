-- Revert dvdrental:tables/language from pg

BEGIN;

DROP TABLE rental.language;

COMMIT;
