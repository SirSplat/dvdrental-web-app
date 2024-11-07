-- Revert dvdrental:tables/address from pg

BEGIN;

DROP TABLE dvdrental.address;

COMMIT;
