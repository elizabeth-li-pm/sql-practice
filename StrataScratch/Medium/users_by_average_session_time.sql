-- Problem: Users By Average Session Time
-- Platform: StrataScratch
-- Link: https://platform.stratascratch.com/coding/10352-users-by-avg-session-time

SELECT lt.user_id, AVG(time_exit - time_load) AS avg_session_duration
FROM ( SELECT
        user_id, DATE(timestamp) AS date, MAX(timestamp) AS time_load
    FROM facebook_web_log
    WHERE action = 'page_load'
    GROUP BY user_id, DATE(timestamp)
) AS lt
JOIN ( SELECT
        user_id, DATE(timestamp) AS date, MIN(timestamp) AS time_exit
    FROM facebook_web_log
    WHERE action = 'page_exit'
    GROUP BY user_id, DATE(timestamp)
) AS et ON lt.user_id = et.user_id AND lt.date = et.date
WHERE time_load < time_exit
GROUP BY lt.user_id
