-- Problem: Signup Confirmation Rate
-- Platform: DataLemur
-- Link: https://datalemur.com/questions/signup-confirmation-rate

SELECT 
  ROUND(COUNT(t.email_id)
  / COUNT(DISTINCT e.email_id)::DECIMAL , 2) AS activation_rate
FROM emails e 
LEFT JOIN texts t ON e.email_id = t.email_id
    AND t.signup_action = 'Confirmed'
