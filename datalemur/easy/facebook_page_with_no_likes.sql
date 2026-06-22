-- Problem: Page With No Likes
-- Platform: DataLemur
-- Link: https://datalemur.com/questions/sql-page-with-no-likes

SELECT page_id FROM pages
LEFT JOIN page_likes USING (page_id)
WHERE liked_date IS NULL
ORDER BY page_id
