-- Problem: International Call Percentage
-- Platform: DataLemur
-- Link: https://datalemur.com/questions/international-call-percentage

SELECT ROUND (
  COUNT(*) FILTER (WHERE pi.country_id <> info.country_id)::DECIMAL /
  COUNT(*) * 100, 1) AS international_calls_pct
FROM phone_calls pc
LEFT JOIN phone_info pi USING (caller_id)
LEFT JOIN phone_info info ON pc.receiver_id = info.caller_id;
