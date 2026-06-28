-- Problem: Workers With The Highest Salaries
-- Platform: StrataScratch
-- Link: https://platform.stratascratch.com/coding/10353-workers-with-the-highest-salaries

SELECT t.worker_title AS best_paid_title
FROM worker w
JOIN title t ON w.worker_id = t.worker_ref_id
WHERE w.salary IN (
    SELECT MAX(salary)
    FROM worker w
    JOIN title t ON w.worker_id = t.worker_ref_id
    WHERE worker_title IS NOT NULL
)
