-- Problem: Confirmation Rate
-- Platform: LeetCode
-- Link: https://leetcode.com/problems/confirmation-rate

SELECT s.user_id,
    ROUND(
        AVG(IF(action = 'confirmed', 1, 0)), 2
    ) AS confirmation_rate
FROM Signups AS s
LEFT JOIN Confirmations AS c USING (user_id)
GROUP BY s.user_id
