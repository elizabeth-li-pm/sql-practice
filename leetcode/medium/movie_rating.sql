-- Problem: Movie Rating
-- Platform: LeetCode
-- Link: https://leetcode.com/problems/movie-rating

(SELECT u.name
FROM (
    SELECT u.name,
        COUNT(mr.movie_id) AS rating_count
    FROM Users AS u
    JOIN MovieRating AS mr USING (user_id)
    GROUP BY u.name
    ORDER BY rating_count DESC, name
) AS t
LIMIT 1)

UNION ALL

(SELECT title
FROM Movies AS m
JOIN MovieRating AS mor ON m.movie_id = mor.movie_id
WHERE created_at < '2020-03-01' AND created_at >= '2020-02-01'
GROUP BY m.title
ORDER BY AVG(mor.rating) DESC, m.title
LIMIT 1)
