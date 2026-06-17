-- Problem: Highest-Grossing Items
-- Platform: DataLemur
-- Link: https://datalemur.com/questions/sql-highest-grossing

SELECT category,
    product,
    total_spend
FROM (SELECT
        category,
        product,
        SUM(spend) AS total_spend,
        ROW_NUMBER() OVER (PARTITION BY category ORDER BY SUM(spend) DESC) AS rank
    FROM product_spend
    WHERE EXTRACT(YEAR FROM transaction_date) = 2022
    GROUP BY category, product
) AS t
WHERE rank IN (1,2)
