-- Revert dvdrental:roles/pgrst_anon-appschema-usage from pg

BEGIN;

REVOKE USAGE ON SCHEMA rental FROM pgrst_anon;

COMMIT;
