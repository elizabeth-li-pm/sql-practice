-- Problem: Average Salaries
-- Platform: StrataScratch
-- Link: https://platform.stratascratch.com/coding/9917-average-salaries

SELECT department,
    first_name,
    salary,
    AVG(salary) OVER (PARTITION BY department) AS avg_salary
FROM employee
