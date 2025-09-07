/* -------------------------------------------------------
   Project: Netflix Viewing Trends
   Query:   Top 15 first-listed directors by number of titles
   Author:  Aarat Mapara
   Date:    2025-09-04
-------------------------------------------------------- */

USE netflix_db;

-- Count most frequent first-listed directors
SELECT
  TRIM(SUBSTRING_INDEX(director, ',', 1)) AS first_director,
  COUNT(*) AS title_count
FROM netflix_titles
WHERE director IS NOT NULL AND director <> ''
GROUP BY first_director
ORDER BY title_count DESC
LIMIT 15;

-- Result:
-- Rajiv Chilaka           : 22
-- Raúl Campos             : 18
-- Marcus Raboy            : 16
-- Suhas Kadav             : 16
-- Jay Karas               : 15
-- Cathy Garcia-Molina     : 13
-- Martin Scorsese         : 12
-- Youssef Chahine         : 12
-- Jay Chapman             : 12
-- Steven Spielberg        : 11
-- Don Michael Paul        : 10
-- Yılmaz Erdoğan          :  9
-- Shannon Hartman         :  9
-- David Dhawan            :  9
-- Troy Miller             :  8

-- Analysis:
-- Rajiv Chilaka (22 titles) and Suhas Kadav (16) highlight the strong contribution of Indian animation and children’s content on Netflix.
-- Raúl Campos and Marcus Raboy appear frequently, reflecting Netflix’s heavy investment in stand-up comedy specials.
-- Legendary global directors like Martin Scorsese and Steven Spielberg also feature, showing Netflix’s mix of blockbuster names and niche creators.
-- The diversity across regions (India, U.S., Egypt, Turkey, Philippines) underscores Netflix’s global expansion strategy.