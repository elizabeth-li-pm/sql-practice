-- Problem: Second Day Confirmation
-- Platform: DataLemur
-- Link: https://datalemur.com/questions/second-day-confirmation

SELECT user_id
FROM emails
JOIN texts USING (email_id)
WHERE DATE(signup_date) = DATE(action_date) - 1
