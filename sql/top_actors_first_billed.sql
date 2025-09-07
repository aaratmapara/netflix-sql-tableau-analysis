/* -------------------------------------------------------
   Project: Netflix Viewing Trends
   Query:   Top 15 first-billed actors by number of titles
   Author:  Aarat Mapara
   Date:    2025-09-04
-------------------------------------------------------- */

USE netflix_db;

-- Extract the first name in the comma-separated 'cast' field and count it
SELECT 
  TRIM(SUBSTRING_INDEX(cast, ',', 1)) AS first_billed_actor,
  COUNT(*) AS title_count
FROM netflix_titles
WHERE cast IS NOT NULL AND cast <> ''
GROUP BY first_billed_actor
ORDER BY title_count DESC
LIMIT 15;

-- Result:
-- Shah Rukh Khan        : 26
-- Akshay Kumar          : 23
-- David Attenborough    : 20
-- Adam Sandler          : 20
-- Amitabh Bachchan      : 20
-- Vatsal Dubey          : 18
-- Nicolas Cage          : 16
-- Ajay Devgn            : 16
-- Aamir Khan            : 14
-- Michela Luci          : 14
-- David Spade           : 13
-- Ahmed Helmy           : 13
-- Anil Kapoor           : 13
-- Salman Khan           : 12
-- Naseeruddin Shah      : 12

-- Analysis:
-- Bollywood stars dominate the list, with Shah Rukh Khan, Akshay Kumar, and Amitabh Bachchan leading.
-- Hollywood comedians and actors like Adam Sandler, David Spade, and Nicolas Cage also feature prominently.
-- David Attenborough’s presence reflects Netflix’s strong investment in documentaries.
-- This mix highlights Netflix’s dual focus: Indian cinema for emerging markets and global stars for worldwide appeal.