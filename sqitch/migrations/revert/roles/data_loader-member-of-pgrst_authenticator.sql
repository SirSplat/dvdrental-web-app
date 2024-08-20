-- Revert dvdrental:roles/data_loader-member-of-pgrst_authenticator from pg

BEGIN;

REVOKE data_loader FROM pgrst_authenticator;

COMMIT;
