-- Problem: Fix Names in a Table
-- Platform: LeetCode
-- Link: https://leetcode.com/problems/fix-names-in-a-table

SELECT user_id,
    UPPER(SUBSTRING(name,1,1)) || LOWER(SUBSTRING(name,2)) AS name
FROM Users
ORDER BY user_id
