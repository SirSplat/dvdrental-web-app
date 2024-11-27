#!/bin/bash
set -e

psql -v ON_ERROR_STP=1 --username "dbo" --dbname "dvdrental" <<-ESQL
    CREATE SCHEMA dsa;
    COMMENT ON SCHEMA dsa IS 'Home of all things ETL.';

    CREATE SCHEMA rental;
    COMMENT ON SCHEMA rental IS 'Home of all things application.';

    CREATE ROLE pgrst_anon WITH NOLOGIN;
    GRANT USAGE ON SCHEMA dsa, rental TO pgrst_anon;
    ALTER DEFAULT PRIVILEGES IN SCHEMA dsa, rental GRANT SELECT ON TABLES TO pgrst_anon;
    COMMENT ON ROLE pgrst_anon IS 'Role for PostgREST anonymous users';

    CREATE ROLE pgrst_authenticator WITH NOINHERIT LOGIN ENCRYPTED PASSWORD '${POSTGREST_DB_PASSWORD}';
    GRANT CONNECT ON DATABASE dvdrental TO pgrst_authenticator;
    COMMENT ON ROLE pgrst_authenticator IS 'Role for PostgREST';

    GRANT pgrst_anon TO pgrst_authenticator;
ESQL

