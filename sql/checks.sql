/* -------------------------------------------------------
   Project: Netflix Viewing Trends
   Script:  Sanity Checks after Data Load
   Author:  Aarat Mapara
   Date:    2025-09-04
-------------------------------------------------------- */

USE netflix_db;

-- 1. Total row count (should be ~8800)
SELECT COUNT(*) AS total_rows FROM netflix_titles;

-- Result:
-- total_rows = 8807

-- Analysis:
-- The dataset contains ~8.8k rows, which matches the expected Netflix Kaggle dataset size.
-- Confirms the data import was successful and complete.


-- 2. First 5 rows (check structure & encoding)
SELECT * FROM netflix_titles LIMIT 5;

-- Analysis:
-- The table structure matches the CSV file correctly (all 12 columns present).
-- UTF-8 text (names, long descriptions) displays properly with no broken characters.
-- Some missing values appear in 'director', 'cast', and 'country', which matches earlier null checks.


-- 3. Distinct types (should be Movie / TV Show)
SELECT DISTINCT type FROM netflix_titles;

-- Result:
-- Movie
-- TV Show

-- Analysis:
-- The 'type' column contains only the two expected categories: Movie and TV Show.
-- Confirms there are no invalid or unexpected labels.


-- 4. Distinct years (to confirm date range)
SELECT MIN(release_year) AS earliest, MAX(release_year) AS latest
FROM netflix_titles;

-- Result:
-- earliest = 1925
-- latest   = 2021

-- Analysis:
-- The dataset spans nearly a century of content, from 1925 classics to 2021 releases.
-- Confirms that 'release_year' values are valid and within expected range.

-- 5. Null check sample (see if important fields have gaps)
SELECT 
  SUM(CASE WHEN director IS NULL OR director='' THEN 1 ELSE 0 END) AS missing_director,
  SUM(CASE WHEN country IS NULL OR country='' THEN 1 ELSE 0 END) AS missing_country,
  SUM(CASE WHEN rating IS NULL OR rating='' THEN 1 ELSE 0 END) AS missing_rating
FROM netflix_titles;

-- Result (approx from Python earlier):
-- missing_director ≈ 2634
-- missing_country  ≈ 831
-- missing_rating   ≈ 4

-- Analysis:
-- Several fields contain missing values, especially 'director' and 'country'.
-- These gaps won't affect overall trend analysis but should be considered in any director/country-specific insights.