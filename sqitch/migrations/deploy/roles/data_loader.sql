-- Deploy dvdrental:roles/data_loader to pg
-- requires: appschema

BEGIN;

CREATE ROLE data_loader WITH LOGIN ENCRYPTED PASSWORD 'mysecretpassword';

COMMIT;
