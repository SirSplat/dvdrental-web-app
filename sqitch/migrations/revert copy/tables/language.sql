-- Revert dvdrental:tables/language from pg

BEGIN;

DROP TABLE dvdrental.language;

COMMIT;
