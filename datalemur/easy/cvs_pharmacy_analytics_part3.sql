-- Problem: Pharmacy Analytics (Part 3)
-- Platform: DataLemur
-- Link: https://datalemur.com/questions/total-drugs-sales

SELECT
    manufacturer,
    '$' || ROUND(SUM(total_sales) / 1000000) || ' million' AS sales_mil
FROM pharmacy_sales
GROUP BY manufacturer
ORDER BY SUM(total_sales) DESC, manufacturer
