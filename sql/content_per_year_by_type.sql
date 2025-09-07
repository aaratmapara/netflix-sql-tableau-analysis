/* -------------------------------------------------------
   Project: Netflix Viewing Trends
   Query:   Content added per year, split by type (Movies vs TV Shows)
   Author:  Aarat Mapara
   Date:    2025-09-04
-------------------------------------------------------- */

USE netflix_db;

SELECT
  YEAR(STR_TO_DATE(TRIM(date_added), '%M %e, %Y')) AS year_added,
  SUM(CASE WHEN type = 'Movie'   THEN 1 ELSE 0 END) AS movies_added,
  SUM(CASE WHEN type = 'TV Show' THEN 1 ELSE 0 END) AS tv_shows_added,
  COUNT(*) AS total_added
FROM netflix_titles
WHERE date_added IS NOT NULL
GROUP BY year_added
ORDER BY year_added;

-- Result:
-- 2008 : movies=1,   tv_shows=1,   total=2
-- 2009 : movies=2,   tv_shows=0,   total=2
-- 2010 : movies=1,   tv_shows=0,   total=1
-- 2011 : movies=13,  tv_shows=0,   total=13
-- 2012 : movies=3,   tv_shows=0,   total=3
-- 2013 : movies=6,   tv_shows=5,   total=11
-- 2014 : movies=19,  tv_shows=5,   total=24
-- 2015 : movies=56,  tv_shows=26,  total=82
-- 2016 : movies=253, tv_shows=176, total=429
-- 2017 : movies=839, tv_shows=349, total=1188
-- 2018 : movies=1237, tv_shows=412, total=1649
-- 2019 : movies=1424, tv_shows=592, total=2016
-- 2020 : movies=1284, tv_shows=595, total=1879
-- 2021 : movies=993,  tv_shows=505, total=1498

-- Analysis:
-- Early years (2008–2014) show mostly movies, with very few TV shows.
-- After 2015, Netflix scaled up aggressively in both categories.
-- From 2016 onward, TV shows grow steadily, reaching ~500 per year by 2021.
-- Despite the TV growth, movies remain the majority of annual additions.