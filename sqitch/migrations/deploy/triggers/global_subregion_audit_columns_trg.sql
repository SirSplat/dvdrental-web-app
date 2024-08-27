-- Deploy dvdrental:triggers/global_subregion_audit_columns_trg to pg
-- requires: appschema
-- requires: functions/audit_columns_trg_func
-- requires: dsaschema
-- requires: tables/global_subregion

BEGIN;

CREATE TRIGGER global_subregion_audit_trg
    BEFORE UPDATE OR DELETE ON dsa.global_subregion
    FOR EACH ROW
    EXECUTE FUNCTION rental.audit_columns_trg_func();

COMMENT ON TRIGGER global_subregion_audit_trg ON dsa.global_subregion IS 'Update audit columns on dsa.global_subregion';

COMMIT;
