--Question: What are the top paying data analyst jobs
--Identify the top 10 highest paying data analytic roles available romotely 
--Focus on job posting with specific salary(remove null's)
--why? highest the top paying opportunities for data analyst, offering insight to employers

Select  job_title, 
        job_title_short,
        name as company_name, 
        job_location,
        job_schedule_type, 
        salary_year_avg, 
        job_posted_date
from job_postings_fact
left JOIN company_dim 
On job_postings_fact.company_id = company_dim.company_id
where job_location = 'Anywhere' AND(job_title_short = 'Data Analyst'
AND salary_year_avg IS NOT NULL)
ORDER BY salary_year_avg DESC
LIMIT 10;


