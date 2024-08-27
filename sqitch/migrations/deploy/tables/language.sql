-- Deploy dvdrental:tables/language to pg
-- requires: appschema
-- requires: tables/audit_columns

BEGIN;

CREATE TABLE rental.language (
    language_fk SMALLINT NOT NULL GENERATED ALWAYS AS IDENTITY CONSTRAINT language_fk PRIMARY KEY,
    language_name TEXT NOT NULL,
    iso2 TEXT NOT NULL,
    iso3 TEXT NOT NULL,
    LIKE rental.audit_columns INCLUDING DEFAULTS INCLUDING COMMENTS,
    CONSTRAINT language_name_not_empty_chk CHECK ( BTRIM( language_name ) <> '' ),
    CONSTRAINT language_name_uidx UNIQUE ( language_name ),
    CONSTRAINT language_iso2_length_chk CHECK ( LENGTH( iso2 ) = 2 ),
    CONSTRAINT language_iso3_length_chk CHECK ( LENGTH( iso3 ) = 3 )
);

COMMENT ON TABLE rental.language IS 'Sourced from ISO 639.';

COMMENT ON COLUMN rental.language.language_fk IS 'Primary key but really only used as a foreign key.';
COMMENT ON COLUMN rental.language.language_name IS 'Language name, sourced from ISO 639 and the natural primary key.';
COMMENT ON COLUMN rental.language.iso2 IS 'ISO 639-1 alpha-2 code.';
COMMENT ON COLUMN rental.language.iso3 IS 'ISO 639-2 alpha-3 code.';

COMMENT ON CONSTRAINT language_name_not_empty_chk ON rental.language IS 'Check constraint on language_name (not empty).';
COMMENT ON CONSTRAINT language_name_uidx ON rental.language IS 'Unique constraint on language_name (natural key).';
COMMENT ON CONSTRAINT language_iso2_length_chk ON rental.language IS 'Check constraint on iso2 (length = 2).';
COMMENT ON CONSTRAINT language_iso3_length_chk ON rental.language IS 'Check constraint on iso3 (length = 3).';

COMMIT;
