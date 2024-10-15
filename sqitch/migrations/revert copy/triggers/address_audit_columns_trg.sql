-- Revert dvdrental:triggers/address_audit_columns_trg from pg

BEGIN;

DROP TRIGGER address_audit_columns_trg ON rental.address;

COMMIT;