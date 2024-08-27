-- Deploy dvdrental:tables/global_sub_region to pg
-- requires: dsaschema
-- requires: tables/global_region

BEGIN;

CREATE TABLE dsa.global_sub_region (
    region_code TEXT NOT NULL,
    subregion_code SMALLINT NOT NULL,
    subregion_name TEXT NOT NULL,
    LIKE rental.audit_columns INCLUDING COMMENTS INCLUDING DEFAULTS,
    CONSTRAINT global_sub_region_pkey PRIMARY KEY ( region_code, subregion_code ),
    CONSTRAINT global_sub_region_region_code_fk FOREIGN KEY ( region_code ) REFERENCES dsa.global_region ( region_code ) DEFERRABLE INITIALLY IMMEDIATE,
    CONSTRAINT global_sub_region_region_code_length_chk CHECK ( LENGTH( region_code ) = 2 ),
    CONSTRAINT global_sub_region_region_code_not_empty_chk CHECK ( BTRIM( region_code ) <> '' ),
    CONSTRAINT global_sub_region_code_not_empty_chk CHECK ( subregion_code <> 0 ),
    CONSTRAINT global_sub_region_name_not_empty_chk CHECK ( BTRIM( subregion_name ) <> '' )
);

COMMENT ON TABLE dsa.global_sub_region IS 'Subregions of the world';
COMMENT ON COLUMN dsa.global_sub_region.region_code IS 'ISO 3166-1 alpha-2 country code';
COMMENT ON COLUMN dsa.global_sub_region.subregion_code IS 'ISO 3166-2 alpha-2 subregion code';
COMMENT ON COLUMN dsa.global_sub_region.subregion_name IS 'Name of the subregion';

COMMENT ON CONSTRAINT global_sub_region_pkey ON dsa.global_sub_region IS 'Primary key constraint on dsa.global_sub_region';
COMMENT ON CONSTRAINT global_sub_region_region_code_fk ON dsa.global_sub_region IS 'Foreign key constraint on dsa.global_sub_region';
COMMENT ON CONSTRAINT global_sub_region_region_code_length_chk ON dsa.global_sub_region IS 'Check constraint on dsa.global_sub_region';
COMMENT ON CONSTRAINT global_sub_region_region_code_not_empty_chk ON dsa.global_sub_region IS 'Check constraint on dsa.global_sub_region';
COMMENT ON CONSTRAINT global_sub_region_code_not_empty_chk ON dsa.global_sub_region IS 'Check constraint on dsa.global_sub_region';
COMMENT ON CONSTRAINT global_sub_region_name_not_empty_chk ON dsa.global_sub_region IS 'Check constraint on dsa.global_sub_region';

COMMIT;
