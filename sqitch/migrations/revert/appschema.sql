-- Revert dvdrental:appschema from pg

BEGIN;

DROP SCHEMA rental;

COMMIT;
