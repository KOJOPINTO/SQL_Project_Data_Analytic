--What are the most in demand skills for my role

SELECT 
    skills_dim.skills AS skill,
    COUNT(skills_job_dim.skill_id) AS skill_count
FROM
    job_postings_fact
left JOIN skills_job_dim
ON job_postings_fact.job_id = skills_job_dim.job_id
LEFT JOIN skills_dim 
ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_postings_fact.job_title_short = 'Data Analyst'
GROUP BY
    skills_dim.skills
ORDER BY
    skill_count DESC
LIMIT 10;