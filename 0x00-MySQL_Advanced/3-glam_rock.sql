-- Create a temporary table to compute lifespan
CREATE TEMPORARY TABLE temp_band_lifespan AS
SELECT
    band_name,
    CASE
        WHEN split = 'present' THEN 2022 - formed
        ELSE split - formed
    END AS lifespan
FROM
    metal_bands;

-- List bands with Glam rock as their main style, ranked by their longevity
SELECT
    band_name,
    lifespan
FROM
    temp_band_lifespan
WHERE
    band_name IN (
        SELECT
            band_name
        FROM
            metal_bands
        WHERE
            style LIKE '%Glam rock%'
    )
ORDER BY
    lifespan DESC;

