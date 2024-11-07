-- Deploy dvdrental:triggers/city_audit_columns_trg to pg
-- requires: appschema
-- requires: functions/audit_columns_trg_func
-- requires: tables/city

BEGIN;

CREATE TRIGGER city_audit_columns_trg
    BEFORE UPDATE OR DELETE ON dvdrental.city
    FOR EACH ROW
    EXECUTE FUNCTION dvdrental.audit_columns_trg_func();

COMMENT ON TRIGGER city_audit_columns_trg ON dvdrental.city IS 'Add audit_columns_trg to dvdrental.city.';

COMMIT;