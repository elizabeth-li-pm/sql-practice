-- Problem: Patient Support Analysis (Part 2)
-- Platform: DataLemur
-- Link: https://datalemur.com/questions/uncategorized-calls-percentage

SELECT ROUND(
  COUNT(*) FILTER (WHERE call_category IS NULL OR call_category = 'n/a')::DECIMAL /
  COUNT(*) * 100, 1) AS uncategorised_call_pct
FROM callers;
