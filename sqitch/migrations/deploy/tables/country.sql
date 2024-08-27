-- Deploy dvdrental:tables/country to pg
-- requires: appschema
-- requires: tables/audit_columns
-- requires: tables/global_region
-- requires: tables/global_sub_region

BEGIN;

CREATE TABLE rental.country (
    sub_region_code SMALLINT NOT NULL,
    country_code SMALLINT NOT NULL,
    iso2 TEXT NOT NULL,
    iso3 TEXT NOT NULL,
    country_name TEXT NOT NULL,
    LIKE rental.audit_columns INCLUDING DEFAULTS INCLUDING COMMENTS,
    CONSTRAINT country_sub_region_fk FOREIGN KEY ( sub_region_code ) REFERENCES rental.global_sub_region ( sub_region_code ) DEFERRABLE INITIALLY IMMEDIATE,
    CONSTRAINT country_pk PRIMARY KEY ( sub_region_code, country_code ),
    CONSTRAINT country_code_uidx UNIQUE ( country_code ),
    CONSTRAINT country_iso2_length_chk CHECK ( LENGTH( iso2 ) = 2 ),
    CONSTRAINT country_iso2_not_empty_chk CHECK ( TRIM( iso2 ) <> '' ),
    CONSTRAINT country_iso3_length_chk CHECK ( LENGTH( iso3 ) = 3 ),
    CONSTRAINT country_iso3_not_empty_chk CHECK ( TRIM( iso3 ) <> '' ),
    CONSTRAINT country_name_not_empty_chk CHECK ( TRIM( country_name ) <> '' )
);

COMMENT ON TABLE rental.country IS 'Sourced from ISO 3166. And populated by external json_imports project.';

COMMENT ON COLUMN rental.country.sub_region_code IS 'Global sub region code, also the foreign key to rental.global_sub_region.';
COMMENT ON COLUMN rental.country.country_code IS 'Country code, sourced from ISO 3166-1.';
COMMENT ON COLUMN rental.country.iso2 IS 'ISO 3166-1 alpha-2 code, length restricted by check constraint to 2 characters.';
COMMENT ON COLUMN rental.country.iso3 IS 'ISO 3166-1 alpha-3 code, length restricted by check constaint to 3 characters.';
COMMENT ON COLUMN rental.country.country_name IS 'Country name, sourced from ISO 3166-1.';

COMMENT ON CONSTRAINT country_sub_region_fk ON rental.country IS 'Foreign key constraint on sub_region_code (global_sub_region).';
COMMENT ON CONSTRAINT country_pk ON rental.country IS 'Primary key constraint on sub_region_code, country_code (natural key).';
COMMENT ON CONSTRAINT country_code_uidx ON rental.country IS 'Unique constraint on country_code.';
COMMENT ON CONSTRAINT country_iso2_length_chk ON rental.country IS 'Check constraint on iso2 (length = 2).';
COMMENT ON CONSTRAINT country_iso2_not_empty_chk ON rental.country IS 'Check constraint on a trimmed iso2 (not empty).';
COMMENT ON CONSTRAINT country_iso3_length_chk ON rental.country IS 'Check constraint on iso3 (length = 3).';
COMMENT ON CONSTRAINT country_iso3_not_empty_chk ON rental.country IS 'Check constraint on a trimmed iso3 (not empty).';
COMMENT ON CONSTRAINT country_name_not_empty_chk ON rental.country IS 'Check constraint on a trimmed country_name (not empty).';

COMMIT;
