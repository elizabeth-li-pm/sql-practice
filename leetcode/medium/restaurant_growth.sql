-- Problem: Restaurant Growth
-- Platform: LeetCode
-- Link: https://leetcode.com/problems/restaurant-growth

WITH revenue AS (
    SELECT visited_on,
        SUM(amount) AS payment,
        ROW_NUMBER() OVER (ORDER BY visited_on) AS rank
    FROM Customer
    GROUP BY visited_on
    ORDER BY visited_on
),
moving AS (
    SELECT visited_on,
        rank,
        SUM(payment) OVER (ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS amount,
        ROUND(AVG(payment) OVER (ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW), 2) AS average_amount
    FROM revenue
)

SELECT visited_on,
    amount,
    average_amount
FROM moving
WHERE rank >= 7
ORDER BY visited_on
