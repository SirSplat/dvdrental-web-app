-- Revert dvdrental:tables/audit_columns from pg

BEGIN;

DROP TABLE dvdrental.audit_columns;

COMMIT;
