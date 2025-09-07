/* -------------------------------------------------------
   Project: Netflix Viewing Trends
   Query:   Ratings distribution (TV-MA, PG-13, etc.)
   Author:  Aarat Mapara
   Date:    2025-09-04
-------------------------------------------------------- */

USE netflix_db;

-- Count titles by rating
SELECT 
  rating,
  COUNT(*) AS title_count
FROM netflix_titles
WHERE rating IS NOT NULL AND rating <> ''
GROUP BY rating
ORDER BY title_count DESC;

-- Result:
-- TV-MA     : 3207
-- TV-14     : 2160
-- TV-PG     :  863
-- R         :  799
-- PG-13     :  490
-- TV-Y7     :  334
-- TV-Y      :  307
-- PG        :  287
-- TV-G      :  220
-- NR        :   80
-- G         :   41
-- TV-Y7-FV  :    6
-- NC-17     :    3
-- UR        :    3
-- 74 min    :    1  (data entry issue)
-- 84 min    :    1  (data entry issue)
-- 66 min    :    1  (data entry issue)

-- Analysis:
-- Netflix’s catalog is dominated by mature ratings:
--   • TV-MA (3200+) is the single largest category.
--   • TV-14 follows with over 2100 titles.
-- Together, these cover the majority of content aimed at adults and teens.
-- Family-friendly content exists (TV-PG, TV-Y, PG), but in much smaller numbers.
-- A few incorrect values like "74 min", "84 min", "66 min" appear due to misclassified duration data.