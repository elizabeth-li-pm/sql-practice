-- Problem: Find Users With Valid E-Mails
-- Platform: LeetCode
-- Link: https://leetcode.com/problems/find-users-with-valid-e-mails

SELECT *
FROM Users
WHERE mail ~ '^[A-Za-z][A-Za-z0-9_.-]*@leetcode\.com$'
