-- Deploy dvdrental:tables/address to pg
-- requires: appschema
-- requires: tables/city

BEGIN;

CREATE TABLE rental.address (
    city_fk BIGINT NOT NULL CONSTRAINT address_city_fk REFERENCES rental.city ( city_fk ) DEFERRABLE INITIALLY IMMEDIATE,
    house_number TEXT NOT NULL,
    street_name TEXT NOT NULL,
    suburb_name TEXT NOT NULL,
    county_name TEXT NOT NULL,
    postal_code TEXT NOT NULL,
    LIKE rental.audit_columns INCLUDING ALL,
    PRIMARY KEY ( city_fk, house_number, street_name, suburb_name, county_name, postal_code )
);
COMMENT ON TABLE rental.address IS 'Address information, sourced from GPT4o.';
COMMENT ON COLUMN rental.address.city_fk IS 'Address foreign key to rental.city.city_fk.';
COMMENT ON COLUMN rental.address.house_number IS 'House number.';
COMMENT ON COLUMN rental.address.street_name IS 'Street name.';
COMMENT ON COLUMN rental.address.suburb_name IS 'Suburb name.';
COMMENT ON COLUMN rental.address.county_name IS 'County name.';
COMMENT ON COLUMN rental.address.postal_code IS 'Postal code.';
COMMENT ON CONSTRAINT address_city_fk ON rental.address IS 'Foreign key constraint referencing rental.city.city_fk.';

COMMIT;
