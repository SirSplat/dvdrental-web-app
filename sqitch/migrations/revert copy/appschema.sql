-- Revert dvdrental:appschema from pg

BEGIN;

DROP SCHEMA dvdrental;

COMMIT;
