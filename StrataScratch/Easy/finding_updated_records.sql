-- Problem: Finding Updated Records
-- Platform: StrataScratch
-- Link: https://platform.stratascratch.com/coding/10299-finding-updated-records

SELECT id, first_name, last_name, department_id, salary
FROM (
    SELECT id, first_name, last_name, department_id, salary,
        ROW_NUMBER() OVER (PARTITION BY id ORDER BY salary DESC) AS rn
    FROM ms_employee_salary
) AS t
WHERE rn = 1
ORDER BY id
