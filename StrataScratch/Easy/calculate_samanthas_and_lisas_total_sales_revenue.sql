-- Problem: Calculate Samantha's and Lisa's total sales revenue
-- Platform: StrataScratch
-- Link: https://platform.stratascratch.com/coding/10127-calculate-samanthas-and-lisas-total-sales-revenue

SELECT SUM(sales_revenue)
FROM sales_performance
WHERE salesperson IN ('Samantha', 'Lisa')
