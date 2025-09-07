/* -------------------------------------------------------
   Project: Netflix Viewing Trends
   Query:   Top 10 genres by number of titles
   Author:  Aarat Mapara
   Date:    2025-09-04
-------------------------------------------------------- */

USE netflix_db;

-- Count titles by primary genre (first listed in 'listed_in')
SELECT 
  TRIM(SUBSTRING_INDEX(listed_in, ',', 1)) AS primary_genre,
  COUNT(*) AS title_count
FROM netflix_titles
WHERE listed_in IS NOT NULL AND listed_in <> ''
GROUP BY primary_genre
ORDER BY title_count DESC
LIMIT 10;

-- Result:
-- Dramas                   : 1600
-- Comedies                 : 1210
-- Action & Adventure       :  859
-- Documentaries            :  829
-- International TV Shows   :  774
-- Children & Family Movies :  605
-- Crime TV Shows           :  399
-- Kids' TV                 :  388
-- Stand-Up Comedy          :  334
-- Horror Movies            :  275

-- Analysis:
-- Dramas and Comedies dominate Netflix’s catalog, together making up nearly 3,000 titles.
-- Action & Adventure and Documentaries are also strong categories.
-- International TV Shows (~774) highlight Netflix’s push for global content.
-- Family- and kid-oriented genres (Children & Family Movies, Kids' TV) also have notable presence.
-- Stand-Up Comedy and Horror Movies reflect Netflix’s niche appeal in entertainment variety.