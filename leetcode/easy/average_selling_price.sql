-- Problem: Average Selling Price
-- Platform: LeetCode
-- Link: https://leetcode.com/problems/average-selling-price

SELECT pri.product_id,
    COALESCE(ROUND(SUM(units * price) /
        SUM(units), 2), 0) AS average_price
FROM Prices AS pri
LEFT JOIN UnitsSold AS unit ON
    pri.product_id = unit.product_id AND
    unit.purchase_date BETWEEN pri.start_date AND pri.end_date
GROUP BY pri.product_id
