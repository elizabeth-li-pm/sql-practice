-- Problem: IBM db2 Product Analytics
-- Platform: DataLemur
-- Link: https://datalemur.com/questions/histogram-users-purchases

SELECT unique_queries,
    COUNT(employee_id) AS employee_count
FROM (
    SELECT e.employee_id,
        COUNT(query_id) AS unique_queries
    FROM employees e
    LEFT JOIN queries q ON e.employee_id = q.employee_id
        AND query_starttime >= '2023-07-01'
        AND query_starttime < '2023-10-01'
    GROUP BY e.employee_id
) AS t
GROUP BY unique_queries
ORDER BY unique_queries
