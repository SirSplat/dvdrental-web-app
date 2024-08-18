-- Deploy dvdrental:roles/pgrst_anon to pg
-- requires: appschema

BEGIN;

CREATE ROLE pgrst_anon WITH NOLOGIN;

COMMIT;
