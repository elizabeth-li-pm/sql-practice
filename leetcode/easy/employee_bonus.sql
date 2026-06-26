-- Problem: Employee Bonus
-- Platform: LeetCode
-- Link: https://leetcode.com/problems/employee-bonus

SELECT Employee.name,
    Bonus.bonus
FROM Employee
LEFT JOIN Bonus USING(empId)
WHERE Bonus.bonus < 1000 OR
    Bonus.bonus IS NULL
