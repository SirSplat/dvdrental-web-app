-- Deploy dvdrental:triggers/address_audit_columns_trg to pg
-- requires: appschema
-- requires: functions/audit_columns_trg_func
-- requires: tables/address

BEGIN;

CREATE TRIGGER address_audit_columns_trg
    BEFORE UPDATE OR DELETE ON dvdrental.address
    FOR EACH ROW
    EXECUTE FUNCTION dvdrental.audit_columns_trg_func();

COMMENT ON TRIGGER address_audit_columns_trg ON dvdrental.address IS 'Add audit_columns_trg to dvdrental.address.';

COMMIT;