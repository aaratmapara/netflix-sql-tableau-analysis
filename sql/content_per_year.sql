/* -------------------------------------------------------
   Project: Netflix Viewing Trends
   Query:   Content added per year
   Author:  Aarat Mapara
   Date:    2025-09-04
-------------------------------------------------------- */

USE netflix_db;

SELECT 
  YEAR(STR_TO_DATE(TRIM(date_added), '%M %e, %Y')) AS year_added,
  COUNT(*) AS count
FROM netflix_titles
WHERE date_added IS NOT NULL
GROUP BY year_added
ORDER BY year_added;

-- Result:
-- 2008 :    2
-- 2009 :    2
-- 2010 :    1
-- 2011 :   13
-- 2012 :    3
-- 2013 :   11
-- 2014 :   24
-- 2015 :   82
-- 2016 :  429
-- 2017 : 1188
-- 2018 : 1649
-- 2019 : 2016
-- 2020 : 1879
-- 2021 : 1498

-- Analysis:
-- Netflix’s catalog remained very small until 2015.
-- From 2015 onward, growth accelerated rapidly, peaking in 2019 with over 2,000 titles.
-- A slight decline in 2020–2021 is likely due to pandemic-related disruptions in global productions.