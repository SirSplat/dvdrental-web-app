-- Deploy dvdrental:roles/pgrst_anon to pg
-- requires: appschema

BEGIN;

CREATE ROLE pgrst_anon WITH NOLOGIN;
COMMENT ON ROLE pgrst_anon IS 'Role for anonymous access to PostgREST.';

COMMIT;
