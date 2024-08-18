-- Deploy dvdrental:tables/audit_columns to pg
-- requires: appschema

BEGIN;

CREATE TABLE rental.audit_columns (
    created_at TIMESTAMP WITH TIME ZONE DEFAULT clock_timestamp(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NULL,
    deleted_at TIMESTAMP WITH TIME ZONE DEFAULT NULL,
    create_by TEXT DEFAULT current_user,
    updated_by TEXT DEFAULT NULL,
    deleted_by TEXT DEFAULT NULL
);

COMMENT ON TABLE rental.audit_columns IS 'Business standardised audit columns, MUST be included in every table!';
COMMENT ON COLUMN rental.audit_columns.created_at IS 'When the record was created';
COMMENT ON COLUMN rental.audit_columns.updated_at IS 'When the record was last updated';
COMMENT ON COLUMN rental.audit_columns.deleted_at IS 'When the record was deleted';
COMMENT ON COLUMN rental.audit_columns.create_by IS 'Who created the record';
COMMENT ON COLUMN rental.audit_columns.updated_by IS 'Who last updated the record';
COMMENT ON COLUMN rental.audit_columns.deleted_by IS 'Who deleted the record';

COMMIT;
