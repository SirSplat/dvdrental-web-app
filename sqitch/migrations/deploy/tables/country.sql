-- Deploy dvdrental:tables/country to pg
-- requires: appschema
-- requires: tables/audit_columns

BEGIN;

CREATE TABLE rental.country (
    country_fk SMALLINT NOT NULL GENERATED ALWAYS AS IDENTITY CONSTRAINT country_fk PRIMARY KEY,
    country_code SMALLINT NOT NULL CONSTRAINT country_code_uidx UNIQUE,
    iso2 TEXT NOT NULL CONSTRAINT country_iso2_length_chk CHECK ( LENGTH( iso2 ) = 2 ),
    iso3 TEXT NOT NULL CONSTRAINT country_iso3_length_chk CHECK ( LENGTH( iso3 ) = 3 ),
    country_name TEXT NOT NULL CONSTRAINT country_name_not_empty_chk CHECK ( country_name <> '' ),
    LIKE rental.audit_columns INCLUDING DEFAULTS INCLUDING COMMENTS
);

COMMENT ON TABLE rental.country IS 'Sourced from ISO 3166. And populated by external json_imports project.';

COMMENT ON COLUMN rental.country.country_code IS 'Country code, sourced from ISO 3166-1.';
COMMENT ON COLUMN rental.country.country_name IS 'Country name, sourced from ISO 3166-1.';
COMMENT ON COLUMN rental.country.iso2 IS 'ISO 3166-1 alpha-2 code, length restricted by check constraint to 2 characters.';
COMMENT ON COLUMN rental.country.iso3 IS 'ISO 3166-1 alpha-3 code, length restricted by check constaint to 3 characters.';

COMMENT ON CONSTRAINT country_fk ON rental.country IS 'Primary key constraint on country_fk (used by foreign key).';
COMMENT ON CONSTRAINT country_code_uidx ON rental.country IS 'Unique constraint on country_code (natural key).';
COMMENT ON CONSTRAINT country_iso2_length_chk ON rental.country IS 'Check constraint on iso2 (length = 2).';
COMMENT ON CONSTRAINT country_iso3_length_chk ON rental.country IS 'Check constraint on iso3 (length = 3).';
COMMENT ON CONSTRAINT country_name_not_empty_chk ON rental.country IS 'Check constraint on country_name (not empty).';

COMMIT;
