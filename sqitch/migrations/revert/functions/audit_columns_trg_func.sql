-- Revert dvdrental:functions/audit_columns_trg_func from pg

BEGIN;

DROP FUNCTION rental.audit_columns_trg_func();

COMMIT;
