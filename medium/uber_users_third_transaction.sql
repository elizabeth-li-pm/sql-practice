-- Problem: User's Third Transaction
-- Platform: DataLemur
-- Link: https://datalemur.com/questions/sql-third-transaction

SELECT user_id, spend, transaction_date
FROM (
    SELECT
        user_id,
        spend,
        transaction_date,
        ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY transaction_date)
    FROM transactions
) AS transactions_rank
WHERE row_number = 3
