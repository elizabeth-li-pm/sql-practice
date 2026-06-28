-- Problem: Total Cost Of Orders
-- Platform: StrataScratch
-- Link: https://platform.stratascratch.com/coding/10183-total-cost-of-orders

SELECT customers.id,
    customers.first_name,
    SUM(orders.total_order_cost) AS sum
FROM customers
JOIN orders ON customers.id = orders.cust_id
GROUP BY customers.id, customers.first_name
ORDER BY customers.first_name
