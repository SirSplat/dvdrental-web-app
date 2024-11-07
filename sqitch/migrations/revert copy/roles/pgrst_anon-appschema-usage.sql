-- Revert dvdrental:roles/pgrst_anon-appschema-usage from pg

BEGIN;

REVOKE USAGE ON SCHEMA dvdrental FROM pgrst_anon;

COMMIT;
