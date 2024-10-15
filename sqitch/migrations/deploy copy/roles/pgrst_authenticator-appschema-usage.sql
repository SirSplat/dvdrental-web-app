-- Deploy dvdrental:roles/pgrst_authenticator-appschema-usage to pg
-- requires: appschema
-- requires: roles/pgrst_authenticator

BEGIN;

GRANT USAGE ON SCHEMA rental TO pgrst_authenticator;

COMMIT;
