-- Deploy dvdrental:tables/lkp_global_region to pg
-- requires: appschema

BEGIN;

CREATE TABLE dsa.lkp_global_region (
    region_fk SMALLINT NOT NULL GENERATED ALWAYS AS IDENTITY,
    region_code SMALLINT NOT NULL,
    region_name TEXT NOT NULL,
    region_iso2 TEXT NOT NULL,
    LIKE rental.audit_columns INCLUDING COMMENTS INCLUDING DEFAULTS,
    CONSTRAINT lkp_global_region_fk UNIQUE ( region_fk ),
    CONSTRAINT lkp_global_region_pkey PRIMARY KEY ( region_code ),
    CONSTRAINT lkp_global_region_iso2_length_chk CHECK ( LENGTH( region_iso2 ) = 2 ),
    CONSTRAINT lkp_global_region_iso2_not_empty_chk CHECK ( BTRIM( region_iso2 ) <> '' ),
    CONSTRAINT lkp_global_region_name_not_empty_chk CHECK ( BTRIM( region_name ) <> '' )
);

COMMENT ON TABLE dsa.lkp_global_region IS 'Global regions. Sourced by GPT4o.';

COMMENT ON COLUMN dsa.lkp_global_region.region_fk IS 'Foreign key for lkp_global_region.';
COMMENT ON COLUMN dsa.lkp_global_region.region_name IS 'Region name.';
COMMENT ON COLUMN dsa.lkp_global_region.region_code IS 'Region code and is the primay key.';
COMMENT ON COLUMN dsa.lkp_global_region.region_iso2 IS 'Region ISO2 code.';

COMMENT ON CONSTRAINT lkp_global_region_fk ON dsa.lkp_global_region IS 'Unique constraint for lkp_global_region_fk.';
COMMENT ON CONSTRAINT lkp_global_region_pkey ON dsa.lkp_global_region IS 'Primary key constraint for lkp_global_region.';
COMMENT ON CONSTRAINT lkp_global_region_iso2_length_chk ON dsa.lkp_global_region IS 'Region code must be 2 characters long.';
COMMENT ON CONSTRAINT lkp_global_region_iso2_not_empty_chk ON dsa.lkp_global_region IS 'Region code must not be empty.';
COMMENT ON CONSTRAINT lkp_global_region_name_not_empty_chk ON dsa.lkp_global_region IS 'Region name must not be empty.';

COMMIT;
