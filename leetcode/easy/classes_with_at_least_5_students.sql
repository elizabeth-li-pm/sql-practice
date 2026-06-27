-- Problem: Classes With at Least 5 Students
-- Platform: LeetCode
-- Link: https://leetcode.com/problems/classes-with-at-least-5-students

SELECT class
FROM Courses
GROUP BY class
HAVING COUNT(student) > 4
