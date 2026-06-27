-- Problem: Patients With a Condition
-- Platform: LeetCode
-- Link: https://leetcode.com/problems/patients-with-a-condition

SELECT *
FROM Patients
WHERE conditions ~ '^DIAB1' OR conditions ~ ' DIAB1'
