-- Deploy dvdrental:roles/data_loader to pg
-- requires: appschema

BEGIN;

CREATE ROLE data_loader WITH LOGIN ENCRYPTED PASSWORD 'mysecretpassword';
COMMENT ON ROLE data_loader IS 'Role for loading data into tables.';

COMMIT;
