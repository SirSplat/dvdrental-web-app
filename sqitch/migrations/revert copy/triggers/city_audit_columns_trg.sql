-- Revert dvdrental:triggers/city_audit_columns_trg from pg

BEGIN;

DROP TRIGGER city_audit_columns_trg ON rental.city;

COMMIT;