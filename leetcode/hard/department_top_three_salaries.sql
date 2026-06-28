-- Problem: Department Top Three Salaries
-- Platform: LeetCode
-- Link: https://leetcode.com/problems/department-top-three-salaries

SELECT Department, Employee, salary AS Salary
FROM ( SELECT dp.name AS Department,
        em.name AS Employee,
        em.salary,
        DENSE_RANK() OVER (PARTITION BY dp.name ORDER BY em.salary DESC) AS rank
    FROM Employee em
    JOIN Department dp ON em.departmentId = dp.id
    ORDER BY Department, rank
) AS t
WHERE rank IN (1,2,3)
