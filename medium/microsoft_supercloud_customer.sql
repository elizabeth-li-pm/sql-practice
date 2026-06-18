-- Problem: Supercloud Customer
-- Platform: DataLemur
-- Link: https://datalemur.com/questions/supercloud-customer

WITH category_purchase AS (
  SELECT cc.customer_id,
    COUNT(DISTINCT p.product_category) AS category_amount
  FROM customer_contracts cc
  JOIN products p USING (product_id)
  GROUP BY cc.customer_id
)

SELECT customer_id
FROM category_purchase
WHERE category_amount = (SELECT COUNT(DISTINCT product_category) FROM products)
