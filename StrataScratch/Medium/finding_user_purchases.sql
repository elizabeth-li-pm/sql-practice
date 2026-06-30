-- Problem: Finding User Purchases
-- Platform: StrataScratch
-- Link: https://platform.stratascratch.com/coding/10322-finding-user-purchases

WITH earliest_order AS ( SELECT
        user_id, MIN(created_at) AS earlist_order
    FROM amazon_transactions
    GROUP BY user_id
)

SELECT DISTINCT atr.user_id
FROM amazon_transactions atr
JOIN earliest_order eo USING (user_id)
WHERE atr.created_at - eo.earlist_order BETWEEN 1 AND 7
ORDER BY atr.user_id
