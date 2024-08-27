-- Revert dvdrental:triggers/lkp_global_region_audit_columns_trg from pg

BEGIN;

DROP TRIGGER lkp_global_region_audit_trg ON dsa.lkp_global_region;

COMMIT;
