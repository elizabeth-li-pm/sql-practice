-- Problem: Sending vs. Opening Snaps
-- Platform: DataLemur
-- Link: https://datalemur.com/questions/sending-vs-opening-snaps

SELECT age_bucket,
    ROUND((time_open / (time_open + time_send)) * 100.0, 2) AS open_perc,
    ROUND((time_send / (time_open + time_send)) * 100.0, 2) AS send_perc
FROM (
    SELECT age_bucket,
        SUM(CASE WHEN activity_type = 'open' THEN time_spent ELSE 0 END) AS time_open,
        SUM(CASE WHEN activity_type = 'send' THEN time_spent ELSE 0 END) AS time_send
    FROM activities a
    JOIN age_breakdown ab USING(user_id)
    GROUP BY age_bucket
) AS t
