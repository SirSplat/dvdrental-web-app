-- Revert dvdrental:roles/pgrst_authenticator-member-of-pgrst_anon from pg

BEGIN;

REVOKE pgrst_anon FROM pgrst_authenticator;

COMMIT;
