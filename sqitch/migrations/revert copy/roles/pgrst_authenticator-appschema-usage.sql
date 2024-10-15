-- Revert dvdrental:roles/pgrst_authenticator-appschema-usage from pg

BEGIN;

REVOKE USAGE ON SCHEMA rental FROM pgrst_authenticator;

COMMIT;
