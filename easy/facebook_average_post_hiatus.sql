-- Problem: Average Post Hiatus (Part 1)
-- Platform: DataLemur
-- Link: https://datalemur.com/questions/sql-average-post-hiatus-1

SELECT
  user_id,
  DATEDIFF(MAX(post_date),MIN(post_date)) AS days_between
FROM posts
WHERE YEAR(post_date) = 2021
GROUP BY user_id
HAVING COUNT(user_id) >= 2
