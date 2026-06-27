-- Problem: The Number of Employees Which Report to Each Employee
-- Platform: LeetCode
-- Link: https://leetcode.com/problems/the-number-of-employees-which-report-to-each-employee

SELECT em1.employee_id,
    em1.name,
    COUNT(em2.name) AS reports_count,
    ROUND(AVG(em2.age)) AS average_age
FROM Employees AS em1
JOIN Employees AS em2 ON em2.reports_to = em1.employee_id
GROUP BY em1.employee_id, em1.name
ORDER BY employee_id
