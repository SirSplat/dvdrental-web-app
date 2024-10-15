-- Deploy dvdrental:triggers/country_audit_columns_trg to pg
-- requires: appschema
-- requires: functions/audit_columns_trg_func
-- requires: tables/country

BEGIN;

CREATE TRIGGER country_audit_columns_trg
    BEFORE UPDATE OR DELETE ON rental.country
    FOR EACH ROW
    EXECUTE FUNCTION rental.audit_columns_trg_func();

COMMENT ON TRIGGER country_audit_columns_trg ON rental.country IS 'Add audit_columns_trg to rental.country.';

COMMIT;