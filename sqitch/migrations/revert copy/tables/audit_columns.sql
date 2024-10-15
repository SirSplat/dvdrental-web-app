-- Revert dvdrental:tables/audit_columns from pg

BEGIN;

DROP TABLE rental.audit_columns;

COMMIT;
