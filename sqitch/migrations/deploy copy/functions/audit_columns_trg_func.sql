-- Deploy dvdrental:functions/audit_columns_trg_func to pg
-- requires: appschema
-- requires: tables/audit_columns

BEGIN;

CREATE OR REPLACE FUNCTION rental.audit_columns_trg_func()
RETURNS TRIGGER AS $$
DECLARE
BEGIN
    IF ( TG_OP = 'UPDATE' ) THEN
        NEW.updated_at = clock_timestamp();
        NEW.updated_by = current_user;

        RETURN NEW;
    ELSIF ( TG_OP = 'DELETE' ) THEN
        EXECUTE format('
            UPDATE %I.%I
            SET deleted_at = clock_timestamp(),
                deleted_by = current_user
            WHERE ctid = $1',
            TG_TABLE_SCHEMA, TG_TABLE_NAME)
        USING OLD.ctid;
    END IF;

    RETURN NULL;
END;
$$
LANGUAGE plpgsql
SECURITY INVOKER;

COMMIT;
