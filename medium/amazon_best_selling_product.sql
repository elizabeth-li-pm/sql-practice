-- Problem: Best-Selling Product
-- Platform: DataLemur
-- Link: https://datalemur.com/questions/best-selling-products

WITH product_ranks AS(
  SELECT category_name,
    product_name,
    sales_quantity,
    rating,
    DENSE_RANK() OVER (PARTITION BY category_name
      ORDER BY sales_quantity DESC, rating DESC) AS rank
  FROM products
  JOIN product_sales USING (product_id)
  ORDER BY category_name
)

SELECT category_name,
  product_name
FROM product_ranks
WHERE rank = 1
