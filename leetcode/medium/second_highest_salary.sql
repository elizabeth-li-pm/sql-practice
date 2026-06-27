-- Problem: Second Highest Salary
-- Platform: LeetCode
-- Link: https://leetcode.com/problems/second-highest-salary

SELECT (SELECT DISTINCT salary
FROM Employee
ORDER BY salary DESC
LIMIT 1 OFFSET 1
) AS SecondHighestSalary
