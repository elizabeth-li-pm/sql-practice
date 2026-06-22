-- Problem: Second Highest Salary
-- Platform: DataLemur
-- Link: https://datalemur.com/questions/sql-second-highest-salary

SELECT DISTINCT salary
FROM (
    SELECT
        salary,
        DENSE_RANK() OVER (ORDER BY salary DESC) AS rank
    FROM employee
) AS salary_rank
WHERE rank = 2
