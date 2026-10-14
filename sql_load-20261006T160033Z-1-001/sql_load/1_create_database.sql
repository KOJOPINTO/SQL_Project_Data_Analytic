CREATE DATABASE sql_course;

-- DROP DATABASE IF EXISTS sql_course;

SELECT COUNT(*)
FROM skills_dim;

SELECT *
FROM job_postings_fact
LIMIT 20;

SELECT job_posted_date
FROM job_postings_fact
LIMIT 10;

SELECT '2026-02-23':: DATE,
'123':: INTEGER,
'true':: BOOLEAN,
'3.4'::REAL;

SELECT
	job_title_short AS title,
	job_location AS locaton,
	job_posted_date :: DATE AS date
FROM 
	job_postings_fact;


SELECT
	job_title_short AS title,
	job_location AS locaton,
	job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST'AS date,
    EXTRACT(YEAR FROM job_posted_date) AS Date_Year
FROM 
	job_postings_fact
LIMIT 5;

SELECT
	EXTRACT(YEAR FROM job_posted_date) AS Year
FROM 
	job_postings_fact
LIMIT 5;

SELECT
    COUNT(job_id) AS ID_count,
    EXTRACT(MONTH FROM job_posted_date) AS job_posted_month
FROM 
	job_postings_fact
WHERE job_title_short = 'Data Analyst'
GROUP BY job_posted_month
ORDER BY ID_count DESC
LIMIT 10

SELECT
	COUNT(job_id) as job_posted_count,
	EXTRACT(MONTH FROM job_posted_date) as job_posted_month
FROM
	job_postings_fact
WHERE
	job_title_short = 'Data Analyst'
GROUP BY
  job_posted_month
ORDER BY
  job_posted_count DESC;


SELECT
	AVG (salary_year_avg) as job_posted_count,
	EXTRACT(MONTH FROM job_posted_date) as job_posted_month
FROM
	job_postings_fact
WHERE
	job_title_short

SELECT*
FROM job_postings_fact
limit 5