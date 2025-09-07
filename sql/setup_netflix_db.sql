/* -------------------------------------------------------
   Project: Netflix Viewing Trends
   Script:  Database and Table Setup + Data Load
   Author:  Aarat Mapara
   Date:    2025-09-04
-------------------------------------------------------- */

-- 1. Create database
CREATE DATABASE IF NOT EXISTS netflix_db;
USE netflix_db;

-- 2. Create table structure
DROP TABLE IF EXISTS netflix_titles;
CREATE TABLE netflix_titles (
  show_id      VARCHAR(10) PRIMARY KEY,
  type         ENUM('Movie','TV Show') NOT NULL,
  title        VARCHAR(255) NOT NULL,
  director     VARCHAR(255),
  cast         TEXT,
  country      VARCHAR(255),
  date_added   VARCHAR(50),        -- kept as text, will parse later
  release_year INT,
  rating       VARCHAR(15),
  duration     VARCHAR(40),
  listed_in    VARCHAR(255),
  description  TEXT
);

-- 3. Data load
-- Option A: If LOCAL INFILE is enabled
-- (may need LOCAL_INFILE=1 on both server and client)
-- LOAD DATA LOCAL INFILE '/path/to/netflix_titles_utf8.csv'
-- INTO TABLE netflix_titles
-- CHARACTER SET utf8mb4
-- FIELDS TERMINATED BY ','
-- ENCLOSED BY '"'
-- LINES TERMINATED BY '\n'
-- IGNORE 1 ROWS
-- (show_id, type, title, director, cast, country, date_added, 
--  release_year, rating, duration, listed_in, description);

-- Option B: If LOCAL INFILE is blocked
-- Use Python (pandas.to_sql) to insert the data instead.
-- Already completed in this project.