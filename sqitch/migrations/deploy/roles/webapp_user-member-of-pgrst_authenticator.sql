-- Deploy dvdrental:roles/webapp_user-member-of-pgrst_authenticator to pg
-- requires: roles/webapp_user
-- requires: roles/pgrst_authenticator

BEGIN;

GRANT webapp_user TO pgrst_authenticator;

COMMIT;
