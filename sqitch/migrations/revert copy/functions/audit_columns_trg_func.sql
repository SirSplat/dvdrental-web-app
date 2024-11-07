-- Revert dvdrental:functions/audit_columns_trg_func from pg

BEGIN;

DROP FUNCTION dvdrental.audit_columns_trg_func();

COMMIT;
