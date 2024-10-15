-- Revert dvdrental:roles/data_loader from pg

BEGIN;

DROP ROLE data_loader;

COMMIT;
