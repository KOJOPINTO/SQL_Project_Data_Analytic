

--Question: What are the top skills required for top paying data analyst jobs.

WITH top_paying_jobs AS (
SELECT  
        job_id,        job_title, 
        job_title_short,
        name as company_name, 
        job_schedule_type, 
        salary_year_avg 
FROM job_postings_fact
LEFT JOIN company_dim 
ON job_postings_fact.company_id = company_dim.company_id
WHERE job_location = 'Anywhere' AND(job_title_short = 'Data Analyst'
AND salary_year_avg IS NOT NULL)
ORDER BY salary_year_avg DESC
LIMIT 10
)

SELECT 
        top_paying_jobs.*,
        skills AS Skills_Required
FROM top_paying_jobs
INNER JOIN skills_job_dim
ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim
ON skills_job_dim.skill_id = skills_dim.skill_id;

/*
What this tells us
- SQL appeared in all 8 jobs. It was the most consistent skill in this sample.
- Python appeared in 7 of 8 jobs. Combining SQL and Python is a strong direction for your analytics learning.
- Tableau appeared in 6 of 8 jobs. Data visualization was also common.
- R appeared in 4 of 8 jobs. It may be useful depending on the role and industry.
- Excel, Pandas, and Snowflake each appeared in 3 of 8 jobs. These are worth recognizing, although this small sample cannot establish their overall market demand.

Results from this query are based on a small sample of 8 jobs. The results may not be representative of the overall market demand for data analyst skills. However, it does provide insight into the skills that are currently in demand for top paying data analyst jobs.
[
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "job_title_short": "Data Analyst",
    "company_name": "AT&T",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "255829.5",
    "skills_required": "sql"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "job_title_short": "Data Analyst",
    "company_name": "AT&T",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "255829.5",
    "skills_required": "python"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "job_title_short": "Data Analyst",
    "company_name": "AT&T",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "255829.5",
    "skills_required": "r"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "job_title_short": "Data Analyst",
    "company_name": "AT&T",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "255829.5",
    "skills_required": "azure"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "job_title_short": "Data Analyst",
    "company_name": "AT&T",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "255829.5",
    "skills_required": "databricks"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "job_title_short": "Data Analyst",
    "company_name": "AT&T",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "255829.5",
    "skills_required": "aws"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "job_title_short": "Data Analyst",
    "company_name": "AT&T",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "255829.5",
    "skills_required": "pandas"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "job_title_short": "Data Analyst",
    "company_name": "AT&T",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "255829.5",
    "skills_required": "pyspark"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "job_title_short": "Data Analyst",
    "company_name": "AT&T",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "255829.5",
    "skills_required": "jupyter"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "job_title_short": "Data Analyst",
    "company_name": "AT&T",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "255829.5",
    "skills_required": "excel"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "job_title_short": "Data Analyst",
    "company_name": "AT&T",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "255829.5",
    "skills_required": "tableau"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "job_title_short": "Data Analyst",
    "company_name": "AT&T",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "255829.5",
    "skills_required": "power bi"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "job_title_short": "Data Analyst",
    "company_name": "AT&T",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "255829.5",
    "skills_required": "powerpoint"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "job_title_short": "Data Analyst",
    "company_name": "Pinterest Job Advertisements",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "232423.0",
    "skills_required": "sql"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "job_title_short": "Data Analyst",
    "company_name": "Pinterest Job Advertisements",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "232423.0",
    "skills_required": "python"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "job_title_short": "Data Analyst",
    "company_name": "Pinterest Job Advertisements",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "232423.0",
    "skills_required": "r"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "job_title_short": "Data Analyst",
    "company_name": "Pinterest Job Advertisements",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "232423.0",
    "skills_required": "hadoop"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "job_title_short": "Data Analyst",
    "company_name": "Pinterest Job Advertisements",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "232423.0",
    "skills_required": "tableau"
  },
  {
    "job_id": 1021647,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "job_title_short": "Data Analyst",
    "company_name": "Uclahealthcareers",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "217000.0",
    "skills_required": "sql"
  },
  {
    "job_id": 1021647,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "job_title_short": "Data Analyst",
    "company_name": "Uclahealthcareers",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "217000.0",
    "skills_required": "crystal"
  },
  {
    "job_id": 1021647,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "job_title_short": "Data Analyst",
    "company_name": "Uclahealthcareers",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "217000.0",
    "skills_required": "oracle"
  },
  {
    "job_id": 1021647,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "job_title_short": "Data Analyst",
    "company_name": "Uclahealthcareers",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "217000.0",
    "skills_required": "tableau"
  },
  {
    "job_id": 1021647,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "job_title_short": "Data Analyst",
    "company_name": "Uclahealthcareers",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "217000.0",
    "skills_required": "flow"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "job_title_short": "Data Analyst",
    "company_name": "SmartAsset",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "205000.0",
    "skills_required": "sql"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "job_title_short": "Data Analyst",
    "company_name": "SmartAsset",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "205000.0",
    "skills_required": "python"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "job_title_short": "Data Analyst",
    "company_name": "SmartAsset",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "205000.0",
    "skills_required": "go"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "job_title_short": "Data Analyst",
    "company_name": "SmartAsset",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "205000.0",
    "skills_required": "snowflake"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "job_title_short": "Data Analyst",
    "company_name": "SmartAsset",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "205000.0",
    "skills_required": "pandas"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "job_title_short": "Data Analyst",
    "company_name": "SmartAsset",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "205000.0",
    "skills_required": "numpy"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "job_title_short": "Data Analyst",
    "company_name": "SmartAsset",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "205000.0",
    "skills_required": "excel"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "job_title_short": "Data Analyst",
    "company_name": "SmartAsset",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "205000.0",
    "skills_required": "tableau"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "job_title_short": "Data Analyst",
    "company_name": "SmartAsset",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "205000.0",
    "skills_required": "gitlab"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "job_title_short": "Data Analyst",
    "company_name": "Inclusively",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "189309.0",
    "skills_required": "sql"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "job_title_short": "Data Analyst",
    "company_name": "Inclusively",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "189309.0",
    "skills_required": "python"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "job_title_short": "Data Analyst",
    "company_name": "Inclusively",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "189309.0",
    "skills_required": "azure"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "job_title_short": "Data Analyst",
    "company_name": "Inclusively",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "189309.0",
    "skills_required": "aws"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "job_title_short": "Data Analyst",
    "company_name": "Inclusively",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "189309.0",
    "skills_required": "oracle"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "job_title_short": "Data Analyst",
    "company_name": "Inclusively",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "189309.0",
    "skills_required": "snowflake"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "job_title_short": "Data Analyst",
    "company_name": "Inclusively",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "189309.0",
    "skills_required": "tableau"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "job_title_short": "Data Analyst",
    "company_name": "Inclusively",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "189309.0",
    "skills_required": "power bi"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "job_title_short": "Data Analyst",
    "company_name": "Inclusively",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "189309.0",
    "skills_required": "sap"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "job_title_short": "Data Analyst",
    "company_name": "Inclusively",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "189309.0",
    "skills_required": "jenkins"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "job_title_short": "Data Analyst",
    "company_name": "Inclusively",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "189309.0",
    "skills_required": "bitbucket"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "job_title_short": "Data Analyst",
    "company_name": "Inclusively",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "189309.0",
    "skills_required": "atlassian"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "job_title_short": "Data Analyst",
    "company_name": "Inclusively",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "189309.0",
    "skills_required": "jira"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "job_title_short": "Data Analyst",
    "company_name": "Inclusively",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "189309.0",
    "skills_required": "confluence"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "job_title_short": "Data Analyst",
    "company_name": "Motional",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "189000.0",
    "skills_required": "sql"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "job_title_short": "Data Analyst",
    "company_name": "Motional",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "189000.0",
    "skills_required": "python"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "job_title_short": "Data Analyst",
    "company_name": "Motional",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "189000.0",
    "skills_required": "r"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "job_title_short": "Data Analyst",
    "company_name": "Motional",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "189000.0",
    "skills_required": "git"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "job_title_short": "Data Analyst",
    "company_name": "Motional",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "189000.0",
    "skills_required": "bitbucket"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "job_title_short": "Data Analyst",
    "company_name": "Motional",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "189000.0",
    "skills_required": "atlassian"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "job_title_short": "Data Analyst",
    "company_name": "Motional",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "189000.0",
    "skills_required": "jira"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "job_title_short": "Data Analyst",
    "company_name": "Motional",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "189000.0",
    "skills_required": "confluence"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "job_title_short": "Data Analyst",
    "company_name": "SmartAsset",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "186000.0",
    "skills_required": "sql"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "job_title_short": "Data Analyst",
    "company_name": "SmartAsset",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "186000.0",
    "skills_required": "python"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "job_title_short": "Data Analyst",
    "company_name": "SmartAsset",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "186000.0",
    "skills_required": "go"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "job_title_short": "Data Analyst",
    "company_name": "SmartAsset",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "186000.0",
    "skills_required": "snowflake"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "job_title_short": "Data Analyst",
    "company_name": "SmartAsset",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "186000.0",
    "skills_required": "pandas"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "job_title_short": "Data Analyst",
    "company_name": "SmartAsset",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "186000.0",
    "skills_required": "numpy"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "job_title_short": "Data Analyst",
    "company_name": "SmartAsset",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "186000.0",
    "skills_required": "excel"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "job_title_short": "Data Analyst",
    "company_name": "SmartAsset",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "186000.0",
    "skills_required": "tableau"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "job_title_short": "Data Analyst",
    "company_name": "SmartAsset",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "186000.0",
    "skills_required": "gitlab"
  },
  {
    "job_id": 387860,
    "job_title": "ERM Data Analyst",
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "184000.0",
    "skills_required": "sql"
  },
  {
    "job_id": 387860,
    "job_title": "ERM Data Analyst",
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "184000.0",
    "skills_required": "python"
  },
  {
    "job_id": 387860,
    "job_title": "ERM Data Analyst",
    "job_title_short": "Data Analyst",
    "company_name": "Get It Recruit - Information Technology",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "184000.0",
    "skills_required": "r"
  }
]
*/