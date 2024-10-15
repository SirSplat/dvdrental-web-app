-- Revert dvdrental:roles/data_loader-appschema-usage from pg

BEGIN;

REVOKE USAGE ON SCHEMA rental FROM data_loader;

COMMIT;
