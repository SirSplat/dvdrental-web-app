-- Deploy dvdrental:triggers/lkp_global_region_audit_columns_trg to pg
-- requires: appschema
-- requires: functions/audit_columns_trg_func
-- requires: dsaschema
-- requires: tables/lkp_global_region

BEGIN;

CREATE TRIGGER lkp_global_region_audit_trg
    BEFORE UPDATE OR DELETE ON dsa.lkp_global_region
    FOR EACH ROW
    EXECUTE FUNCTION rental.audit_columns_trg_func();

COMMENT ON TRIGGER lkp_global_region_audit_trg ON dsa.lkp_global_region IS 'Update audit columns on dsa.lkp_global_region';

COMMIT;
