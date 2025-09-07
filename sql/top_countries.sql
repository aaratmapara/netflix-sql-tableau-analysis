/* -------------------------------------------------------
   Project: Netflix Viewing Trends
   Query:   Top 10 countries by number of titles
   Author:  Aarat Mapara
   Date:    2025-09-04
-------------------------------------------------------- */

USE netflix_db;

-- Count titles per country (using only the first listed country).
SELECT 
  TRIM(SUBSTRING_INDEX(country, ',', 1)) AS main_country,
  COUNT(*) AS title_count
FROM netflix_titles
WHERE country IS NOT NULL AND country <> ''
GROUP BY main_country
ORDER BY title_count DESC
LIMIT 10;

-- Result:
-- United States   : 3211
-- India           : 1008
-- United Kingdom  : 628
-- Canada          : 271
-- Japan           : 259
-- France          : 212
-- South Korea     : 211
-- Spain           : 181
-- Mexico          : 134
-- Australia       : 117

-- Analysis:
-- The United States dominates the Netflix catalog with over 3,200 titles.
-- India (1000+) and the UK (600+) are the next largest contributors.
-- Strong representation from Japan and South Korea shows the global appeal of Asian content.
-- The rest of the top 10 countries (France, Spain, Mexico, Australia) contribute moderately,
-- reflecting Netflix’s gradual international expansion.