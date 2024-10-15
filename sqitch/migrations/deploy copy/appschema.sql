-- Deploy dvdrental:appschema to pg

BEGIN;

CREATE SCHEMA rental;
COMMENT ON SCHEMA rental IS 'Home of all things DVD Rental.';

COMMIT;
