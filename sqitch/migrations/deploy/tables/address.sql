-- Deploy dvdrental:tables/address to pg
-- requires: appschema
-- requires: tables/audit_columns
-- requires: tables/global_region
-- requires: tables/global_sub_region
-- requires: tables/country
-- requires: tables/city

BEGIN;

CREATE TABLE rental.address (
    address_fk BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY,
    city_fk BIGINT NOT NULL,
    house_number TEXT NULL,
    street_name TEXT NULL,
    suburb_name TEXT NULL,
    county_name TEXT NULL,
    postal_code TEXT NULL,
    LIKE rental.audit_columns INCLUDING DEFAULTS INCLUDING COMMENTS,
    CONSTRAINT address_pk PRIMARY KEY ( city_fk, house_number, street_name, suburb_name, county_name, postal_code ),
    CONSTRAINT city_fk FOREIGN KEY ( city_fk ) REFERENCES rental.city ( city_fk ) DEFERRABLE INITIALLY IMMEDIATE,
    CONSTRAINT address_fk_uidx UNIQUE ( address_fk )
);
COMMENT ON TABLE rental.address IS 'Address information, sourced from GPT4o.';

COMMENT ON COLUMN rental.address.city_fk IS 'Address foreign key to rental.city.city_fk.';
COMMENT ON COLUMN rental.address.house_number IS 'House number.';
COMMENT ON COLUMN rental.address.street_name IS 'Street name.';
COMMENT ON COLUMN rental.address.suburb_name IS 'Suburb name.';
COMMENT ON COLUMN rental.address.county_name IS 'County name.';
COMMENT ON COLUMN rental.address.postal_code IS 'Postal code.';

COMMENT ON CONSTRAINT address_pk ON rental.address IS 'Primary key.';
COMMENT ON CONSTRAINT city_fk ON rental.address IS 'Foreign key to rental.city.city_fk.';
COMMENT ON CONSTRAINT address_fk_uidx ON rental.address IS 'Unique constraint on address_fk.';

COMMIT;
