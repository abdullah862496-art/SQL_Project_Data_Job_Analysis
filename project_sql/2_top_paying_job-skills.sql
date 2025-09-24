

with top_paying_jobs as (


        SELECT
                job_id,
                job_title,
                salary_year_avg,
                name as company_name
        FROM
                job_postings_fact

        LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
        WHERE
                job_title_short = 'Data Analyst' and
                job_location = 'Anywhere'and
                salary_year_avg is not NULL
        ORDER BY
                salary_year_avg DESC
        limit 10
)

select 
        top_paying_jobs.*,
        skills
from top_paying_jobs
inner JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
order BY
        salary_year_avg DESC 

        