-- Deploy dvdrental:tables/country to pg
-- requires: appschema
-- requires: tables/audit_columns
-- requires: dsaschema
-- requires: tables/global_subregion

BEGIN;

CREATE TABLE rental.country (
    country_fk SMALLINT NOT NULL GENERATED ALWAYS AS IDENTITY,
    subregion_fk SMALLINT NOT NULL,
    country_code SMALLINT NOT NULL,
    iso2 TEXT NOT NULL,
    iso3 TEXT NOT NULL,
    country_name TEXT NOT NULL,
    LIKE rental.audit_columns INCLUDING DEFAULTS INCLUDING COMMENTS,
    CONSTRAINT country_fk UNIQUE ( country_fk ),
    CONSTRAINT country_subregion_fk FOREIGN KEY ( subregion_fk ) REFERENCES dsa.global_subregion ( subregion_fk ) DEFERRABLE INITIALLY IMMEDIATE,
    CONSTRAINT country_pk PRIMARY KEY ( subregion_code, country_code ),
    CONSTRAINT country_code_uidx UNIQUE ( country_code ),
    CONSTRAINT country_iso2_length_chk CHECK ( LENGTH( iso2 ) = 2 ),
    CONSTRAINT country_iso2_not_empty_chk CHECK ( TRIM( iso2 ) <> '' ),
    CONSTRAINT country_iso3_length_chk CHECK ( LENGTH( iso3 ) = 3 ),
    CONSTRAINT country_iso3_not_empty_chk CHECK ( TRIM( iso3 ) <> '' ),
    CONSTRAINT country_name_not_empty_chk CHECK ( TRIM( country_name ) <> '' )
);

COMMENT ON TABLE rental.country IS 'Sourced from ISO 3166. And populated by external json_imports project.';

COMMENT ON COLUMN rental.country.country_fk IS 'Foreign key for country.';
COMMENT ON COLUMN rental.country.subregion_fk IS 'Foreign key for global_subregion.';
COMMENT ON COLUMN rental.country.country_code IS 'Country code, sourced from ISO 3166-1.';
COMMENT ON COLUMN rental.country.iso2 IS 'ISO 3166-1 alpha-2 code, length restricted by check constraint to 2 characters.';
COMMENT ON COLUMN rental.country.iso3 IS 'ISO 3166-1 alpha-3 code, length restricted by check constaint to 3 characters.';
COMMENT ON COLUMN rental.country.country_name IS 'Country name, sourced from ISO 3166-1.';

COMMENT ON CONSTRAINT country_fk ON rental.country IS 'Unique constraint on country_fk.';
COMMENT ON CONSTRAINT country_subregion_fk ON rental.country IS 'Foreign key constraint on subregion_fk (global_subregion).';
COMMENT ON CONSTRAINT country_pk ON rental.country IS 'Primary key constraint on subregion_code, country_code (natural key).';
COMMENT ON CONSTRAINT country_code_uidx ON rental.country IS 'Unique constraint on country_code.';
COMMENT ON CONSTRAINT country_iso2_length_chk ON rental.country IS 'Check constraint on iso2 (length = 2).';
COMMENT ON CONSTRAINT country_iso2_not_empty_chk ON rental.country IS 'Check constraint on a trimmed iso2 (not empty).';
COMMENT ON CONSTRAINT country_iso3_length_chk ON rental.country IS 'Check constraint on iso3 (length = 3).';
COMMENT ON CONSTRAINT country_iso3_not_empty_chk ON rental.country IS 'Check constraint on a trimmed iso3 (not empty).';
COMMENT ON CONSTRAINT country_name_not_empty_chk ON rental.country IS 'Check constraint on a trimmed country_name (not empty).';

COMMIT;
