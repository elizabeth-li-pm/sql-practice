-- Problem: Swapped Food Delivery
-- Platform: DataLemur
-- Link: https://datalemur.com/questions/sql-swapped-food-delivery

SELECT order_id,
  CASE
    WHEN order_id % 2 = 1 THEN COALESCE(LEAD(item) OVER (ORDER BY order_id), item)
    ELSE LAG(item) OVER (ORDER BY order_id)
  END AS item
FROM orders
