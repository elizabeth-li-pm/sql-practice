-- Problem: Employees Earning More Than Their Managers
-- Platform: DataLemur
-- Link: https://datalemur.com/questions/sql-managers-employees

SELECT DISTINCT e.employee_id,
    e.name
FROM employee e
JOIN employee em ON e.manager_id = em.employee_id
WHERE e.salary > em.salary
