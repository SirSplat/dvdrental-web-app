-- Deploy dvdrental:triggers/city_audit_columns_trg to pg
-- requires: appschema
-- requires: functions/audit_columns_trg_func
-- requires: tables/city

BEGIN;

CREATE TRIGGER city_audit_columns_trg
    BEFORE UPDATE OR DELETE ON rental.city
    FOR EACH ROW
    EXECUTE FUNCTION rental.audit_columns_trg_func();

COMMENT ON TRIGGER city_audit_columns_trg ON rental.city IS 'Add audit_columns_trg to rental.city.';

COMMIT;