-- Deploy dvdrental:roles/data_loader-table-privileges to pg
-- requires: appschema
-- requires: roles/data_loader
-- requires: tables/country
-- requires: tables/city
-- requires: tables/address
-- requires: tables/language

BEGIN;

GRANT
    SELECT,
    INSERT
ON TABLE
    rental.country,
    rental.city,
    rental.address,
    rental.language
TO data_loader;

COMMIT;
