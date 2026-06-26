-- Problem: Project Employees I
-- Platform: LeetCode
-- Link: https://leetcode.com/problems/project-employees-i

SELECT pro.project_id,
    ROUND (AVG(experience_years), 2) AS average_years
FROM Project AS pro
LEFT JOIN Employee AS emp USING (employee_id)
GROUP BY pro.project_id
