-- Problem: Duplicate Job Listings
-- Platform: DataLemur
-- Link: https://datalemur.com/questions/duplicate-job-listings

SELECT COUNT(company_id) AS duplicate_companies
FROM(
    SELECT 
        company_id,
        title,
        COUNT(description) AS job_amount
    FROM job_listings
    GROUP BY company_id, title
    HAVING job_amount > 1
) AS t
