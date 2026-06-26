-- Problem: Managers with at Least 5 Direct Reports
-- Platform: LeetCode
-- Link: https://leetcode.com/problems/managers-with-at-least-5-direct-reports

-- Solution 1: Subquery (simpler, no JOIN needed)
SELECT name FROM Employee
WHERE id IN
(SELECT managerId FROM Employee
GROUP BY managerId
HAVING COUNT(*) >= 5)

-- Solution 2: Self-join
SELECT e1.name
FROM Employee e1
JOIN Employee e2 ON e2.managerId = e1.id
GROUP BY e1.name
HAVING COUNT(e2.id) >= 5
