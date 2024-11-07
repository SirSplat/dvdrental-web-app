-- Deploy dvdrental:roles/pgrst_anon-appschema-usage to pg
-- requires: appschema
-- requires: roles/pgrst_anon

BEGIN;

GRANT USAGE ON SCHEMA dvdrental TO pgrst_anon;

COMMIT;
