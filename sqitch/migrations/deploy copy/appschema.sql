-- Deploy dvdrental:appschema to pg

BEGIN;

CREATE SCHEMA dvdrental;
COMMENT ON SCHEMA dvdrental IS 'Home of all things DVD Rental.';

COMMIT;
