-- Problem: Game Play Analysis IV
-- Platform: LeetCode
-- Link: https://leetcode.com/problems/game-play-analysis-iv

WITH first_login AS (
    SELECT player_id, MIN(event_date) AS first_time
    FROM Activity
    GROUP BY player_id
)
SELECT ROUND(COUNT(fl.player_id) / COUNT(DISTINCT a.player_id)::DECIMAL,2) AS fraction
FROM Activity AS a
LEFT JOIN first_login AS fl ON
    fl.player_id = a.player_id AND
    a.event_date = fl.first_time + interval '1 day'
