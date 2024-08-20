-- Deploy dvdrental:tables/language to pg
-- requires: appschema
-- requires: tables/audit_columns

BEGIN;

CREATE TABLE rental.language (
    language_fk SMALLINT NOT NULL GENERATED ALWAYS AS IDENTITY CONSTRAINT language_fk PRIMARY KEY,
    language_name TEXT NOT NULL CONSTRAINT language_name_not_empty_chk CHECK ( language_name <> '' ),
    iso2 TEXT NOT NULL CONSTRAINT language_iso2_length_chk CHECK ( LENGTH( iso2 ) = 2 ),
    iso3 TEXT NOT NULL CONSTRAINT language_iso3_length_chk CHECK ( LENGTH( iso3 ) = 3 ),
    LIKE rental.audit_columns INCLUDING DEFAULTS INCLUDING COMMENTS
);

COMMENT ON TABLE rental.language IS 'Sourced from ISO 639.';

COMMENT ON COLUMN rental.language.language_name IS 'Language name, sourced from ISO 639.';
COMMENT ON COLUMN rental.language.iso2 IS 'ISO 639-1 alpha-2 code, length restricted by check constraint to 2 characters.';
COMMENT ON COLUMN rental.language.iso3 IS 'ISO 639-2 alpha-3 code, length restricted by check constaint to 3 characters.';
COMMENT ON CONSTRAINT language_name_not_empty_chk ON rental.language IS 'Check constraint on language_name (not empty).';

COMMIT;
