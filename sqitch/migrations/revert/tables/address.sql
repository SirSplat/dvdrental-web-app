-- Revert dvdrental:tables/address from pg

BEGIN;

DROP TABLE rental.address;

COMMIT;
