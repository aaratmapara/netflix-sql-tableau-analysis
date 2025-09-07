/* -------------------------------------------------------
   Project: Netflix Viewing Trends
   Query:   Duration analysis (Movies in minutes, TV shows in seasons)
   Author:  Aarat Mapara
   Date:    2025-09-04
-------------------------------------------------------- */

USE netflix_db;

-- Longest 15 Movies (by minutes)
SELECT
  title,
  CAST(REPLACE(duration, ' min', '') AS UNSIGNED) AS minutes
FROM netflix_titles
WHERE type = 'Movie'
  AND duration LIKE '% min'
  AND duration IS NOT NULL
ORDER BY minutes DESC
LIMIT 15;

-- Longest 15 TV Shows (by seasons)
SELECT
  title,
  CAST(
    REPLACE(
      REPLACE(duration, ' Seasons', ''),
      ' Season', ''
    ) AS UNSIGNED
  ) AS seasons
FROM netflix_titles
WHERE type = 'TV Show'
  AND (duration LIKE '% Season' OR duration LIKE '% Seasons')
  AND duration IS NOT NULL
ORDER BY seasons DESC
LIMIT 15;

-- Summary stats: average duration by type
SELECT
  'Movie' AS type,
  ROUND(AVG(CAST(REPLACE(duration, ' min', '') AS UNSIGNED)), 1) AS avg_movie_minutes,
  NULL AS avg_tv_seasons
FROM netflix_titles
WHERE type = 'Movie' AND duration LIKE '% min'

UNION ALL

SELECT
  'TV Show' AS type,
  NULL AS avg_movie_minutes,
  ROUND(AVG(
    CAST(
      REPLACE(REPLACE(duration, ' Seasons', ''), ' Season', '') AS UNSIGNED
    )
  ), 2) AS avg_tv_seasons
FROM netflix_titles
WHERE type = 'TV Show' AND (duration LIKE '% Season' OR duration LIKE '% Seasons');

-- Results:
-- Longest Movies:
--   Black Mirror: Bandersnatch – 312 min
--   Headspace: Unwind Your Mind – 273 min
--   The School of Mischief – 253 min
--   No Longer Kids – 237 min
--   Lock Your Girls In – 233 min
--   Raya and Sakina – 230 min
--   Once Upon a Time in America – 229 min
--   Lagaan – 224 min
--   Jodhaa Akbar – 214 min
--   The Irishman – 209 min
--   … (others in top 15 between 205–212 min)

-- Longest TV Shows:
--   Grey's Anatomy – 17 seasons
--   Supernatural – 15 seasons
--   NCIS – 15 seasons
--   Heartland – 13 seasons
--   Criminal Minds – 12 seasons
--   Trailer Park Boys – 12 seasons
--   … (others around 10–11 seasons)

-- Summary stats:
--   Movies: average length ~99.6 minutes
--   TV Shows: average length ~1.76 seasons

-- Analysis:
-- Most Netflix movies cluster around ~100 minutes, aligning with typical feature films.
-- A few exceptional long-form entries (Bandersnatch, The Irishman, Lagaan) run over 3+ hours.
-- TV shows average under 2 seasons, suggesting Netflix often carries short runs or limited series.
-- Long-running shows like Grey’s Anatomy (17 seasons) and Supernatural (15 seasons) are rare but boost catalog depth.