# SQL Data Analytics Project

## Project Overview

This project demonstrates my practical SQL skills through a data analytics project focused on job postings, salaries, companies, and skills.

The goal is to use SQL to explore job market data, answer business questions, and identify insights that can support data-driven career and business decisions.

SQL queries? Check them out here: [project_sql folder](/project_sql/)

## Objectives

- Explore job postings and salary information.
- Analyze job titles, locations, and company information.
- Examine the skills associated with different job opportunities.
- Practice writing SQL queries to answer real-world analytical questions.
- Strengthen my skills in data retrieval, filtering, aggregation, and table joins.

## Tools and Technologies

- **SQL** — querying and analyzing relational data.
- **PostgreSQL** - the chosen database management system, ideal for handling the job posting data.
- **Relational database** — creating and modifying database tables.
- **Git and GitHub** — version control and project documentation.
- **Visual Studio Code** — writing and managing SQL scripts.

## The Analysis
### 1.  Top-Paying Jobs for Data Analysts
To identify the highest-paying Data Analyst roles, I filtered job postings by average yearly salary and location, focusing on remote opportunities. This query highlights high-paying opportunities in the field.
```sql
SELECT  job_title, 
        job_title_short,
        name AS company_name, 
        job_location,
        job_schedule_type, 
        salary_year_avg, 
        job_posted_date
FROM job_postings_fact
LEFT JOIN company_dim 
ON job_postings_fact.company_id = company_dim.company_id
WHERE job_location = 'Anywhere' AND(job_title_short = 'Data Analyst'
AND salary_year_avg IS NOT NULL)
ORDER BY salary_year_avg DESC
LIMIT 10;
```
The query identifies the 10 highest-paying job postings classified as Data Analyst roles, based on average annual salary. 
## Key findings
- Highest reported salary: Mantys, at $650,000 annually.
- Leadership roles feature prominently: Director, Associate Director, and Principal positions appear among the highest-paying results.
- Remote opportunities are represented: All 10 listings show the location as “Anywhere,” suggesting remote flexibility in the dataset.
## Important observation: 
The $650,000 figure is substantially higher than the second-highest salary, so it is worth verifying the original job posting. Also, these are the highest-paying results in this query, not necessarily typical Data Analyst salaries. The dataset is from 2023, so the figures should not be treated as current salary benchmarks.

![Top Paying Data Analyst Roles](Assets/Top%20paying%20role%20for%20Aata%20Analyst.png)

* Bar graph visualize top 10 paying role for data analyst. 

## 2. Top Skills Required for Top-Paying Data Analyst Jobs
To identify the skills required for high-paying Data Analyst roles, I analyzed job postings with the highest average salaries and examined the skills associated with those positions.

```sql
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
```
### What this tells Us:

### 📊 Most In-Demand Skills in My Data Analyst Job Sample

| Rank | Skill | Number of Jobs | Percentage |
| --- | --- | --- | --- |
| 1 | SQL | 8 out of 8 | 100% |
| 2 | Python | 7 out of 8 | 87.5% |
| 3 | Tableau | 6 out of 8 | 75% |
| 4 | R | 4 out of 8 | 50% |
| 5 | Excel | 3 out of 8 | 37.5% |
| 5 | Pandas | 3 out of 8 | 37.5% |
| 5 | Snowflake | 3 out of 8 | 37.5% |

**Key Insight:** SQL was the most consistent skill, appearing in all 8 job postings. Python and Tableau followed, appearing in 7 and 6 postings, respectively.

*Note: This analysis covers only 8 job postings and does not establish overall market demand.*

## 3. Most In-Demand Skills for Data Analysts
Counted skill requirements across Data Analyst job postings to determine which skills appeared most frequently.

```sql
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
```
## 3. 📊 Top 10 Most In-Demand Skills for Data Analysts

The analysis of job postings identified SQL, Excel, and Python as the three most frequently requested skills. Data visualization tools such as Tableau and Power BI also ranked highly, suggesting that employers value both data manipulation and the ability to communicate insights visually.

### Top 10 Skills Table

| Rank | Skill | Skill Count | Share of SQL Count |
|---:|---|---:|---:|
| 1 | SQL | 92,628 | 100.0% |
| 2 | Excel | 67,031 | 72.4% |
| 3 | Python | 57,326 | 61.9% |
| 4 | Tableau | 46,554 | 50.3% |
| 5 | Power BI | 39,468 | 42.6% |
| 6 | R | 30,075 | 32.5% |
| 7 | SAS | 28,068 | 30.3% |
| 8 | PowerPoint | 13,848 | 14.9% |
| 9 | Word | 13,591 | 14.7% |
| 10 | SAP | 11,297 | 12.2% |

*Note: The percentages compare each skill's count with SQL's count; they are not percentages of all job postings.*

### 🔍 Key Insights

**1. SQL is the leading technical skill.**  
SQL recorded 92,628 mentions, the highest count in the analysis. This highlights the importance of learning how to retrieve, filter, join, aggregate, and analyze data from relational databases.

**2. Excel remains highly relevant.**  
With 67,031 mentions, Excel ranked second. Data Analysts should be comfortable with formulas, PivotTables, data cleaning, lookups, and basic reporting.

**3. Python is an important complementary skill.**  
Python recorded 57,326 mentions. Combined with SQL, it can support data cleaning, exploratory data analysis, automation, and more advanced analytical tasks.

**4. Tableau and Power BI are valuable visualization tools.**  
Tableau recorded 46,554 mentions, while Power BI recorded 39,468. Learning at least one of these tools can help analysts create dashboards and communicate findings to stakeholders.

**5. Statistical and specialized tools also matter.**  
R and SAS recorded 30,075 and 28,068 mentions, respectively. Their relevance may depend on the industry and whether a role emphasizes statistical analysis, research, or specialized enterprise analytics.

**6. Business communication and enterprise systems are also represented.**  
PowerPoint, Word, and SAP appeared in the top 10. These skills can support reporting, documentation, presentations, and business processes alongside core analytical work.

### 🎯 Recommendations for Aspiring Data Analysts

Based on these findings, I would prioritize learning in the following order:

1. **SQL:** Build a strong foundation in joins, aggregations, subqueries, and CTEs.
2. **Excel:** Develop practical data cleaning, analysis, and reporting skills.
3. **Python:** Practice using Pandas for data manipulation and analysis.
4. **Power BI or Tableau:** Build interactive dashboards and present insights.
5. **Business communication:** Learn to explain analytical findings clearly and make evidence-based recommendations.

### ✅ Conclusion

The findings suggest that a strong Data Analyst skill set combines database querying, spreadsheet analysis, programming, and data visualization. SQL is the highest priority in this dataset, while Excel and Python provide complementary capabilities.

## 4. 🎯 Most Optimal Skills to Learn for Data Analysts

This analysis compares skill demand with average annual salary to identify which skills may offer the best learning opportunities for aspiring Data Analysts.

### 📊 Skills Demand and Salary Analysis

| Rank by Demand | Skill | Demand Count | Average Salary |
|---:|---|---:|---:|
| 1 | SQL | 3,083 | $96,435 |
| 2 | Excel | 2,143 | $86,419 |
| 3 | Python | 1,840 | $101,512 |
| 4 | Tableau | 1,659 | $97,978 |
| 5 | R | 1,073 | $98,708 |
| 6 | Power BI | 1,044 | $92,324 |
| 7 | Word | 527 | $82,941 |
| 8 | PowerPoint | 524 | $88,316 |
| 9 | SAS | 500 | $93,707 |
| 10 | SQL Server | 336 | $96,191 |
| 11 | Oracle | 332 | $100,964 |
| 12 | Azure | 319 | $105,400 |
| 13 | AWS | 291 | $106,440 |
| 14 | Go | 288 | $97,267 |
| 15 | Flow | 271 | $98,020 |
| 16 | Looker | 260 | $103,855 |
| 17 | Snowflake | 241 | $111,578 |
| 18 | SPSS | 212 | $85,293 |

*Note: The duplicate SAS row has been removed. Salaries are presented as provided in the dataset.*

### 🔍 Key Insights

**1. SQL offers the strongest starting point.**

SQL has the highest demand count at 3,083, with an average salary of $96,435. This makes it a sensible foundation for querying databases, joining tables, and analyzing business data.

**2. Python combines substantial demand with a higher average salary.**

Python appears 1,840 times and has an average salary of $101,512. It is a valuable complement to SQL for data cleaning, automation, statistical analysis, and machine learning.

**3. Snowflake has the highest average salary in this table.**

Snowflake is associated with an average salary of $111,578, despite having a lower demand count of 241. This may indicate opportunities in cloud data platforms, but the result does not prove that learning Snowflake alone will lead to a higher salary.

**4. Cloud skills are worth exploring after the fundamentals.**

AWS averages $106,440 and Azure averages $105,400 in this dataset. These skills may be particularly useful for roles involving cloud infrastructure, data engineering, and cloud-based analytics.

**5. Tableau and Power BI support data storytelling.**

Tableau has an average salary of $97,978, while Power BI averages $92,324. Both can help analysts turn data into dashboards and communicate insights to decision-makers.

**6. Excel remains useful, but salary alone should not determine learning priorities.**

Excel has the second-highest demand count at 2,143, although its average salary is $86,419. It remains valuable for everyday analysis, reporting, and business operations.

### 🚀 Recommended Learning Priorities

| Priority | Skill | Reason |
|---:|---|---|
| 1 | SQL | Highest demand count; essential database querying foundation |
| 2 | Python | Strong demand and $101,512 average salary |
| 3 | Excel | High demand and widely useful for business analysis |
| 4 | Power BI or Tableau | Dashboard development and visualization |
| 5 | Snowflake or AWS/Azure | Potential specialization in cloud data platforms |

### ✅ Conclusion

The findings suggest that SQL, Python, and Excel are strong foundational skills, while visualization tools support practical analytics work. Cloud technologies such as Snowflake, AWS, and Azure may provide a path toward specialization.

## 5.  💰 Top 20 Skills by Average Salary

This analysis identifies the skills associated with the highest average annual salaries in the dataset. The results highlight technologies in software development, cloud infrastructure, machine learning, and data engineering.

### 📊 Highest-Paying Skills

| Rank | Skill | Average Annual Salary |
|---:|---|---:|
| 1 | SVN | $400,000 |
| 2 | Solidity | $179,000 |
| 3 | Couchbase | $160,515 |
| 4 | DataRobot | $155,486 |
| 5 | Golang | $155,000 |
| 6 | MXNet | $149,000 |
| 7 | dplyr | $147,633 |
| 8 | VMware | $147,500 |
| 9 | Terraform | $146,734 |
| 10 | Twilio | $138,500 |
| 11 | GitLab | $134,126 |
| 12 | Kafka | $129,999 |
| 13 | Puppet | $129,820 |
| 14 | Keras | $127,013 |
| 15 | PyTorch | $125,226 |
| 16 | Perl | $124,686 |
| 17 | Ansible | $124,370 |
| 18 | Hugging Face | $123,950 |
| 19 | TensorFlow | $120,647 |
| 20 | Cassandra | $118,407 |

*Note: Salaries are reported as provided in the dataset and may vary by role, experience, location, and sample size.*

### 🔍 Key Insights

**1. SVN has the highest reported average salary.**

SVN leads the table at $400,000, substantially above every other skill. This unusually high value should be investigated before drawing conclusions. It could reflect a small number of postings, senior-level positions, or an outlier rather than typical earning potential.

**2. Specialized technologies dominate the rankings.**

Skills such as Solidity, Golang, Terraform, Kafka, and Cassandra are associated with software engineering, infrastructure, and data engineering roles. They may require a different career path from traditional Data Analyst positions.

**3. Machine learning and AI tools feature prominently.**

DataRobot, MXNet, Keras, PyTorch, Hugging Face, and TensorFlow appear in the list. These tools are relevant to machine learning and AI development, although learning them alone does not guarantee access to high-paying roles.

**4. Infrastructure and automation skills are valuable areas to explore.**

Terraform, VMware, Puppet, Ansible, and GitLab relate to infrastructure management, deployment, and software delivery. They may be especially relevant for people pursuing cloud engineering, DevOps, or platform engineering.

**5. dplyr is relevant to data analysis.**

The R package dplyr appears with an average salary of $147,633. However, this does not mean dplyr itself causes higher salaries; postings mentioning it may be for more experienced or specialized positions.

### 🎯 Career Takeaway

High average salaries can help identify specialized career opportunities, but salary should not be the only factor when choosing a skill. Demand, the number of job postings, required experience, learning time, and alignment with career goals are equally important.

For someone targeting Data Analyst positions, SQL, Python, Excel, and a visualization tool remain practical starting points. Specialized skills such as cloud platforms, machine learning frameworks, and infrastructure automation can be added as career goals develop.


## Database Structure

The project uses tables designed to organize job market information:

- `job_postings_fact` — job posting information.
- `company_dim` — company information.
- `skills_dim` — information about skills.
- `skills_job_dim` — relationships between job postings and skills.

These tables support analysis involving job postings, companies, salaries, and required skills.

## SQL Skills Demonstrated

- `SELECT` and `FROM`
- Filtering with `WHERE`
- Sorting with `ORDER BY`
- Calculations and column aliases
- Aggregate functions such as `COUNT`, `AVG`, `MIN`, `MAX`, and `SUM`
- Grouping with `GROUP BY` and filtering groups with `HAVING`
- Joining related tables
- NULL Handling: Using `IS NULL` and `IS NOT NULL` to identify missing and non-missing values.
- Common Table Expressions (CTEs): Using `WITH` to break complex analytical queries into readable, manageable steps.
- Database and table creation and modification

## Project Structure

```text
SQL_Project_Data_Analytic/
├── project_sql/
│   └── query1.sql
├── sql_load-20261006T160033Z-1-001/
│   └── sql_load/
│       ├── 1_create_database.sql
│       ├── 2_create_tables.sql
│       └── 3_modify_tables.sql
├── .gitignore
└── README.md
```

## How to Use This Project

1. Review the SQL scripts in the `sql_load` folder.
2. Create the database and tables using the relevant scripts.
3. Load the required datasets into the tables.
4. Open `project_sql/query1.sql` to review and run the analysis queries.

**Note:** The CSV datasets are not included in this repository because of their size. The required data files must be obtained separately before running queries that depend on them.

## About Me

I hold a Master of Science in Data Analytics and have a professional background in IT support. I am continuing to develop my practical SQL and data analytics skills by working on projects that address real-world questions.

I welcome opportunities to contribute my technical, analytical, and problem-solving skills to a data analytics team.


