-- Problem: Replace Employee ID With The Unique Identifier
-- Platform: LeetCode
-- Link: https://leetcode.com/problems/replace-employee-id-with-the-unique-identifier

SELECT eu.unique_id,
    e.name
FROM Employees e
LEFT JOIN EmployeeUNI eu USING (id)
