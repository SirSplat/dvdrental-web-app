-- Revert dvdrental:dsaschema from pg

BEGIN;

DROP SCHEMA dsa;

COMMIT;
