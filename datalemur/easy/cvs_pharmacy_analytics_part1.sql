-- Problem: Pharmacy Analytics (Part 1)
-- Platform: DataLemur
-- Link: https://datalemur.com/questions/top-profitable-drugs

SELECT drug,
    SUM(total_sales) - SUM(cogs) AS total_profit
FROM pharmacy_sales
GROUP BY drug
ORDER BY total_profit DESC
LIMIT 3
