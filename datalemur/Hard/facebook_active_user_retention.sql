-- Problem: Active User Retention
-- Platform: DataLemur
-- Link: https://datalemur.com/questions/user-retention

SELECT EXTRACT(MONTH FROM a.event_date) AS month,
  COUNT(DISTINCT a.user_id) AS monthly_active_users
FROM user_actions a
WHERE EXISTS (
  SELECT 1
  FROM user_actions b
  WHERE b.user_id = a.user_id
    AND EXTRACT(MONTH FROM b.event_date) =
        EXTRACT(MONTH FROM a.event_date - interval '1 month')
)
  AND EXTRACT(MONTH FROM a.event_date) = 7
  AND EXTRACT(YEAR FROM a.event_date) = 2022
GROUP BY EXTRACT(MONTH FROM a.event_date)
