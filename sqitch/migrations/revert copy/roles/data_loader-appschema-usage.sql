-- Revert dvdrental:roles/data_loader-appschema-usage from pg

BEGIN;

REVOKE USAGE ON SCHEMA dvdrental FROM data_loader;

COMMIT;
