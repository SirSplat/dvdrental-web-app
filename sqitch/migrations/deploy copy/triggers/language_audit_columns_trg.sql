-- Deploy dvdrental:triggers/language_audit_columns_trg to pg
-- requires: appschema
-- requires: functions/audit_columns_trg_func
-- requires: tables/language

BEGIN;

CREATE TRIGGER language_audit_columns_trg
    BEFORE UPDATE OR DELETE ON dvdrental.language
    FOR EACH ROW
    EXECUTE FUNCTION dvdrental.audit_columns_trg_func();

COMMENT ON TRIGGER language_audit_columns_trg ON dvdrental.language IS 'Add audit_columns_trg to dvdrental.language.';

COMMIT;