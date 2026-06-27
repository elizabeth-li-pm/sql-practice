-- Problem: User Activity for the Past 30 Days I
-- Platform: LeetCode
-- Link: https://leetcode.com/problems/user-activity-for-the-past-30-days-i

SELECT activity_date AS day,
    COUNT(DISTINCT user_id) AS active_users
FROM (
    SELECT *
    FROM Activity
    WHERE activity_date BETWEEN '2019-06-28' AND '2019-07-27'
) AS t
GROUP BY activity_date
