-- Deploy dvdrental:dsaschema to pg

BEGIN;

CREATE SCHEMA dsa;
COMMENT ON SCHEMA dsa IS 'Home of all things ETL.';

COMMIT;
