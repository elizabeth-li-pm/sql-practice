-- Problem: List the Products Ordered in a Period
-- Platform: LeetCode
-- Link: https://leetcode.com/problems/list-the-products-ordered-in-a-period

SELECT product_name, SUM(unit) AS unit
FROM (
    SELECT product_name, order_date, unit
    FROM Products AS p
    JOIN Orders AS o USING (product_id)
    WHERE order_date < '2020-03-01' AND order_date >= '2020-02-01'
)
GROUP BY product_name
HAVING SUM(unit) >= 100
