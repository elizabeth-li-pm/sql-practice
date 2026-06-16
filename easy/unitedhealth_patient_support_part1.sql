-- Problem: Patient Support Analysis (Part 1)
-- Platform: DataLemur
-- Link: https://datalemur.com/questions/frequent-callers

SELECT COUNT(policy_holder_id) AS policy_id_count
FROM (
    SELECT
        policy_holder_id,
        COUNT(case_id) AS call_amount
    FROM callers
    GROUP BY policy_holder_id
) AS call_records
WHERE call_amount > 2
