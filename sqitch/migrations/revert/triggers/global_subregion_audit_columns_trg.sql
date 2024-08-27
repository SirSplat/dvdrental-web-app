-- Revert dvdrental:triggers/global_subregion_audit_columns_trg from pg

BEGIN;

DROP TRIGGER global_subregion_audit_trg ON dsa.global_subregion;

COMMIT;
