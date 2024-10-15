-- Revert dvdrental:triggers/country_audit_columns_trg from pg

BEGIN;

DROP TRIGGER country_audit_columns_trg ON rental.country;

COMMIT;