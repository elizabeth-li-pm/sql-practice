-- Problem: Article Views I
-- Platform: LeetCode
-- Link: https://leetcode.com/problems/article-views-i

SELECT DISTINCT author_id AS id
FROM Views
WHERE viewer_id = author_id
ORDER BY author_id;
