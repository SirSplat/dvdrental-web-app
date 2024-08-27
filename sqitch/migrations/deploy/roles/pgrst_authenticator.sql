-- Deploy dvdrental:roles/pgrst_authenticator to pg
-- requires: roles/pgrst_anon

BEGIN;

CREATE ROLE pgrst_authenticator WITH LOGIN PASSWORD 'mysecretpassword';
COMMENT ON ROLE pgrst_authenticator IS 'Role for authenticating to PostgREST.';

COMMIT;
