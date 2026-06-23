-- Problem: Customer Who Visited but Did Not Make Any Transactions
-- Platform: LeetCode
-- Link: https://leetcode.com/problems/customer-who-visited-but-did-not-make-any-transactions

SELECT v.customer_id,
    COUNT(*) AS count_no_trans
FROM Visits v
LEFT JOIN Transactions tr USING (visit_id)
WHERE tr.transaction_id IS NULL
GROUP BY v.customer_id
