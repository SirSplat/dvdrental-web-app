-- Revert dvdrental:roles/webapp_user-member-of-pgrst_authenticator to pg

BEGIN;

REVOKE webapp_user FROM pgrst_authenticator;

COMMIT;
