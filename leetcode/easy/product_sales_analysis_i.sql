-- Problem: Product Sales Analysis I
-- Platform: LeetCode
-- Link: https://leetcode.com/problems/product-sales-analysis-i

SELECT p.product_name,
    s.year,
    s.price
FROM Sales s
JOIN Product p USING (product_id)
