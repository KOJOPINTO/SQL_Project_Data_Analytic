# SQL Data Analytics Project

## Project Overview

This project demonstrates my practical SQL skills through a data analytics project focused on job postings, salaries, companies, and skills.

The goal is to use SQL to explore job market data, answer business questions, and identify insights that can support data-driven career and business decisions.

## Objectives

- Explore job postings and salary information.
- Analyze job titles, locations, and company information.
- Examine the skills associated with different job opportunities.
- Practice writing SQL queries to answer real-world analytical questions.
- Strengthen my skills in data retrieval, filtering, aggregation, and table joins.

## Tools and Technologies

- **SQL** — querying and analyzing relational data.
- **Relational database** — creating and modifying database tables.
- **Git and GitHub** — version control and project documentation.
- **Visual Studio Code** — writing and managing SQL scripts.

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
