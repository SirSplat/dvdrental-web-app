-- Deploy dvdrental:triggers/address_audit_columns_trg to pg
-- requires: appschema
-- requires: functions/audit_columns_trg_func
-- requires: tables/address

BEGIN;

CREATE TRIGGER address_audit_columns_trg
    BEFORE UPDATE OR DELETE ON rental.address
    FOR EACH ROW
    EXECUTE FUNCTION rental.audit_columns_trg_func();

COMMENT ON TRIGGER address_audit_columns_trg ON rental.address IS 'Add audit_columns_trg to rental.address.';

COMMIT;