-- Verify dvdrental:functions/audit_columns_trg_func on pg

BEGIN;

SELECT pg_catalog.has_function_privilege( current_user, 'rental.audit_columns_trg_func()', 'execute' );

ROLLBACK;
