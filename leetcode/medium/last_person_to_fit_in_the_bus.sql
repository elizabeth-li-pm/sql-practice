-- Problem: Last Person to Fit in the Bus
-- Platform: LeetCode
-- Link: https://leetcode.com/problems/last-person-to-fit-in-the-bus

SELECT person_name
FROM (
    SELECT person_name,
        SUM(weight) OVER (ORDER BY turn) AS total_weight
    FROM Queue
) AS t
WHERE total_weight <= 1000
ORDER BY total_weight DESC
LIMIT 1
