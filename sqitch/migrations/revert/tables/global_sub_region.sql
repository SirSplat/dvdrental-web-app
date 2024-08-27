-- Revert dvdrental:tables/global_sub_region from pg

BEGIN;

DROP TABLE dsa.global_sub_region;

COMMIT;
