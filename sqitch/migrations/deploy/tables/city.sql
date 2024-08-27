-- Deploy dvdrental:tables/city to pg
-- requires: appschema
-- requires: tables/audit_columns
-- requires: tables/global_region
-- requires: tables/global_sub_region
-- requires: tables/country

BEGIN;

CREATE TABLE rental.city (
    city_fk BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY,
    country_code SMALLINT NOT NULL,
    city_name TEXT NOT NULL,
    LIKE rental.audit_columns INCLUDING DEFAULTS INCLUDING COMMENTS,
    CONSTRAINT country_fk FOREIGN KEY ( country_code ) REFERENCES rental.country ( country_code ) DEFERRABLE INITIALLY IMMEDIATE,
    CONSTRAINT city_name_not_empty_chk CHECK ( TRIM( city_name ) <> '' ),
    CONSTRAINT city_pk PRIMARY KEY ( country_code, city_name )
) PARTITION BY LIST ( country_code );

COMMENT ON TABLE rental.city IS 'City information, sourced from ISO 369.';

COMMENT ON COLUMN rental.city.country_code IS 'Foreign key to country.country_code, used in table joins.';
COMMENT ON COLUMN rental.city.city_fk IS 'City foreign key, used in table joins.';
COMMENT ON COLUMN rental.city.city_name IS 'City name.';

COMMENT ON CONSTRAINT country_fk ON rental.city IS 'Foreign key constraint on country_fk (country).';
COMMENT ON CONSTRAINT city_name_not_empty_chk ON rental.city IS 'Check constraint on a trimmed city_name (not empty).';
COMMENT ON CONSTRAINT city_pk ON rental.city IS 'Primary key constraint on city_pk (natural key).';

COMMIT;
