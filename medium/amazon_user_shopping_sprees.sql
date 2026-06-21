-- Problem: User Shopping Sprees
-- Platform: DataLemur
-- Link: https://datalemur.com/questions/amazon-shopping-spree

WITH transaction_order AS(
  SELECT user_id,
    transaction_date::DATE AS t_date,
    ROW_NUMBER() OVER (PARTITION BY user_id
      ORDER BY transaction_date) AS rn
  FROM transactions
),

gap_groups AS (
  SELECT user_id,
    t_date - rn::INTEGER AS gap
  FROM transaction_order
)

SELECT DISTINCT user_id
FROM gap_groups
GROUP BY user_id, gap
HAVING COUNT(*) >= 3
ORDER BY user_id
