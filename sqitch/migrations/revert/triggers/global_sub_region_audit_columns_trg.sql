-- Revert dvdrental:triggers/global_sub_region_audit_columns_trg from pg

BEGIN;

DROP TRIGGER global_sub_region_audit_trg ON dsa.global_sub_region;

COMMIT;
