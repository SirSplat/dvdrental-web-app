-- Revert dvdrental:roles/data_loader-table-privileges from pg

BEGIN;

REVOKE ALL ON ALL TABLES IN SCHEMA rental FROM data_loader;

COMMIT;
