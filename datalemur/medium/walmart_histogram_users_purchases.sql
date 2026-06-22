-- Problem: Histogram of Users and Purchases
-- Platform: DataLemur
-- Link: https://datalemur.com/questions/histogram-users-purchases

WITH ranked_date AS (
  SELECT user_id,
    transaction_date,
    product_id,
    RANK() OVER (PARTITION BY user_id ORDER BY transaction_date DESC) AS r_num
  FROM user_transactions
)

SELECT transaction_date,
  user_id,
  COUNT(*) AS purchase_count
FROM ranked_date
WHERE r_num = 1
GROUP BY transaction_date, user_id
ORDER BY transaction_date
