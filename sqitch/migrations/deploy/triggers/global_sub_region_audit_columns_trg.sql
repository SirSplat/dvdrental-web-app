-- Deploy dvdrental:triggers/global_sub_region_audit_columns_trg to pg
-- requires: appschema
-- requires: functions/audit_columns_trg_func
-- requires: dsaschema
-- requires: tables/global_sub_region

BEGIN;

CREATE TRIGGER global_sub_region_audit_trg
    BEFORE UPDATE OR DELETE ON dsa.global_sub_region
    FOR EACH ROW
    EXECUTE FUNCTION rental.audit_columns_trg_func();

COMMENT ON TRIGGER global_sub_region_audit_trg ON dsa.global_sub_region IS 'Update audit columns on dsa.global_sub_region';

COMMIT;
