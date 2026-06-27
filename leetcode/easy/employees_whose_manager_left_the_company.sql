-- Problem: Employees Whose Manager Left the Company
-- Platform: LeetCode
-- Link: https://leetcode.com/problems/employees-whose-manager-left-the-company

SELECT em1.employee_id
FROM Employees em1
LEFT JOIN Employees em2 ON em2.employee_id = em1.manager_id
WHERE em1.salary < 30000 AND em1.manager_id IS NOT NULL AND em2.employee_id IS NULL
ORDER BY employee_id
