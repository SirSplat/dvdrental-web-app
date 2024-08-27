-- Deploy dvdrental:triggers/global_region_audit_columns_trg to pg
-- requires: appschema
-- requires: functions/audit_columns_trg_func
-- requires: dsaschema
-- requires: tables/global_region

BEGIN;

CREATE TRIGGER global_region_audit_trg
    BEFORE UPDATE OR DELETE ON dsa.global_region
    FOR EACH ROW
    EXECUTE FUNCTION rental.audit_columns_trg_func();

COMMENT ON TRIGGER global_region_audit_trg ON dsa.global_region IS 'Update audit columns on dsa.global_region';

COMMIT;
