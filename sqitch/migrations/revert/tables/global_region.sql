-- Revert dvdrental:tables/global_region from pg

BEGIN;

DROP TABLE dsa.global_region;

COMMIT;
