-- Verify dvdrental:data/language-data-load-into-json_imports on pg

BEGIN;

DO
$$
DECLARE
    json_count INT := 0;
    language_name_count INT := 0;
    language_iso2_count INT := 0;
    language_iso3_count INT := 0;
BEGIN
    SELECT
        COALESCE( COUNT( * ), 0 )
    FROM
        dsa.json_imports
    INTO
        json_count;

    ASSERT json_count > 0, 'No data found in dsa.json_imports.';

    SELECT
        COUNT(DISTINCT val->>'language_name'),
        COUNT(DISTINCT val->>'iso2'),
        COUNT(DISTINCT val->>'iso3')
    FROM
        dsa.json_imports
    INTO
        language_name_count,
        language_iso2_count,
        language_iso3_count;

    ASSERT language_name_count = json_count, 'Duplicate language_names found in dsa.json_imports.';
    ASSERT language_iso2_count = json_count, 'Duplicate language iso2 found in dsa.json_imports.';
    ASSERT language_iso3_count = json_count, 'Duplicate language iso3 found in dsa.json_imports.';
END;
$$;

ROLLBACK;
