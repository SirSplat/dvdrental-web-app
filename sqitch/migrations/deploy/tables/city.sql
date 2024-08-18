-- Deploy dvdrental:tables/city to pg
-- requires: appschema
-- requires: tables/country
-- requires: tables/audit_columns

BEGIN;

CREATE TABLE rental.city (
    city_fk BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY CONSTRAINT city_fk UNIQUE,
    country_fk SMALLINT NOT NULL CONSTRAINT city_country_fk REFERENCES rental.country ( country_fk ) DEFERRABLE INITIALLY IMMEDIATE,
    city_name TEXT NOT NULL,
    LIKE rental.audit_columns INCLUDING ALL,
    PRIMARY KEY (country_fk, city_fk)
);
COMMENT ON TABLE rental.city IS 'City information, sourced from ISO 369.';
COMMENT ON COLUMN rental.city.country_fk IS 'Foreign key to country.country_fk, used in table joins.';
COMMENT ON COLUMN rental.city.city_fk IS 'City foreign key, used in table joins.';
COMMENT ON COLUMN rental.city.city_name IS 'City name.';

COMMIT;
