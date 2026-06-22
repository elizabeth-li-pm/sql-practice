-- Problem: Cities With Completed Trades
-- Platform: DataLemur
-- Link: https://datalemur.com/questions/completed-trades

SELECT
    city,
    COUNT(order_id) AS completed_trade
FROM trades
JOIN users USING (user_id)
WHERE status = 'Completed'
GROUP BY city
ORDER BY completed_trade DESC
LIMIT 3
