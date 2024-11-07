-- Revert dvdrental:roles/pgrst_authenticator-appschema-usage from pg

BEGIN;

REVOKE USAGE ON SCHEMA dvdrental FROM pgrst_authenticator;

COMMIT;
