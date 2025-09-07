/* -------------------------------------------------------
   Project: Netflix Viewing Trends
   Query:   Avg years from release to Netflix (by type)
   Author:  Aarat Mapara
   Date:    2025-09-04
-------------------------------------------------------- */

USE netflix_db;

-- Compute year_added from the text date, then average the lag by type
SELECT
  type,
  ROUND(AVG(
    YEAR(STR_TO_DATE(TRIM(date_added), '%M %e, %Y')) - release_year
  ), 2) AS avg_years_to_catalog,
  COUNT(*) AS titles_count
FROM netflix_titles
WHERE 
  date_added IS NOT NULL 
  AND release_year IS NOT NULL
  AND YEAR(STR_TO_DATE(TRIM(date_added), '%M %e, %Y')) IS NOT NULL
  AND YEAR(STR_TO_DATE(TRIM(date_added), '%M %e, %Y')) >= release_year
GROUP BY type
ORDER BY avg_years_to_catalog;

-- Result:
-- TV Show : avg_years_to_catalog = 2.31, titles_count = 2654
-- Movie   : avg_years_to_catalog = 5.73, titles_count = 6129

-- Analysis:
-- TV shows reach Netflix much faster than movies, with an average lag of just ~2.3 years.
-- Movies take longer (~5.7 years), suggesting Netflix often licenses older films for its catalog.
-- This reflects Netflix’s strategic focus on offering fresh TV content while maintaining a back-catalog of movies.