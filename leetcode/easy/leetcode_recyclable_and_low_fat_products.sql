-- Problem: Recyclable and Low Fat Products
-- Platform: LeetCode
-- Link: https://leetcode.com/problems/recyclable-and-low-fat-products

SELECT product_id
FROM Products
WHERE low_fats = 'Y' AND
      recyclable = 'Y';
