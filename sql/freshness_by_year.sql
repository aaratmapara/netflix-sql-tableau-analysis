/* -------------------------------------------------------
   Project: Netflix Viewing Trends
   Query:   Freshness trend — avg lag between release and Netflix addition by year
   Author:  Aarat Mapara
   Date:    2025-09-04
-------------------------------------------------------- */

USE netflix_db;

SELECT
  YEAR(STR_TO_DATE(TRIM(date_added), '%M %e, %Y')) AS year_added,
  ROUND(AVG(
    YEAR(STR_TO_DATE(TRIM(date_added), '%M %e, %Y')) - release_year
  ), 2) AS avg_lag_years,
  COUNT(*) AS titles_added
FROM netflix_titles
WHERE 
  date_added IS NOT NULL
  AND release_year IS NOT NULL
  AND YEAR(STR_TO_DATE(TRIM(date_added), '%M %e, %Y')) IS NOT NULL
  AND YEAR(STR_TO_DATE(TRIM(date_added), '%M %e, %Y')) >= release_year
GROUP BY year_added
ORDER BY year_added;

-- Result:
-- 2008 : avg_lag=1.50 yrs, titles_added=2
-- 2009 : avg_lag=1.00 yrs, titles_added=2
-- 2010 : avg_lag=23.00 yrs, titles_added=1
-- 2011 : avg_lag=19.92 yrs, titles_added=13
-- 2012 : avg_lag=1.00 yrs, titles_added=3
-- 2013 : avg_lag=0.90 yrs, titles_added=10
-- 2014 : avg_lag=3.00 yrs, titles_added=24
-- 2015 : avg_lag=1.34 yrs, titles_added=82
-- 2016 : avg_lag=2.96 yrs, titles_added=427
-- 2017 : avg_lag=3.94 yrs, titles_added=1187
-- 2018 : avg_lag=4.13 yrs, titles_added=1646
-- 2019 : avg_lag=5.28 yrs, titles_added=2012
-- 2020 : avg_lag=4.69 yrs, titles_added=1876
-- 2021 : avg_lag=5.75 yrs, titles_added=1498

-- Analysis:
-- In the early years (2008–2015), Netflix focused on relatively fresh titles, often within 1–2 years of release.
-- After 2016, as the catalog expanded rapidly, the average lag increased to 3–6 years.
-- The peak lag of ~5.75 years in 2021 suggests more back-catalog acquisitions.
-- This reflects Netflix’s strategy shift: initially prioritizing new releases, then broadening the library with older films/series.