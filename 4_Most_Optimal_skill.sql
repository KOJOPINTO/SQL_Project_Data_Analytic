--What are the most optimal skills to learn

WITH demanding_skills AS (
    SELECT 
    skills_dim.skill_id,
    skills_dim.skills,
        COUNT(skills_job_dim.skill_id) AS Demand_count
    FROM
        job_postings_fact
    left JOIN skills_job_dim
    ON job_postings_fact.job_id = skills_job_dim.job_id
    LEFT JOIN skills_dim 
    ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    GROUP BY
        skills_dim.skill_id
   
), AVG_Salary AS (
    SELECT
    skills_dim.skill_id,
        skills,
       ROUND(AVG(salary_year_avg), 0) AS avg_salary
    FROM
        job_postings_fact
    LEFT JOIN skills_job_dim
    ON job_postings_fact.job_id = skills_job_dim.job_id
    LEFT JOIN skills_dim 
    ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE job_title_short = 'Data Analyst' 
    AND salary_year_avg IS NOT NULL
    GROUP BY skills_dim.skill_id
    
)

SELECT
    demanding_skills.skill_id,
    demanding_skills.skills,
    Demand_count,
    avg_salary
FROM demanding_skills
inner JOIN AVG_Salary
ON demanding_skills.skill_id = AVG_Salary.skill_id
order by demand_count DESC, avg_salary DESC