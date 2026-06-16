-- Problem: Final Account Balance
-- Platform: DataLemur
-- Link: https://datalemur.com/questions/final-account-balance

SELECT
    account_id,
    SUM(
    CASE
        WHEN transaction_type = 'Deposit' THEN amount
        ELSE -amount
    END) AS balance_amount
FROM transactions
GROUP BY account_id
