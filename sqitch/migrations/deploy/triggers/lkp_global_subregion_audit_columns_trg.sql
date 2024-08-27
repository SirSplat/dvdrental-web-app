-- Deploy dvdrental:triggers/lkp_global_subregion_audit_columns_trg to pg
-- requires: appschema
-- requires: functions/audit_columns_trg_func
-- requires: dsaschema
-- requires: tables/lkp_global_subregion

BEGIN;

CREATE TRIGGER lkp_global_subregion_audit_trg
    BEFORE UPDATE OR DELETE ON dsa.lkp_global_subregion
    FOR EACH ROW
    EXECUTE FUNCTION rental.audit_columns_trg_func();

COMMENT ON TRIGGER lkp_global_subregion_audit_trg ON dsa.lkp_global_subregion IS 'Update audit columns on dsa.lkp_global_subregion';

COMMIT;
