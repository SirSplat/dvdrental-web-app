-- Revert dvdrental:triggers/language_audit_columns_trg from pg

BEGIN;

DROP TRIGGER language_audit_columns_trg ON dvdrental.language;

COMMIT;