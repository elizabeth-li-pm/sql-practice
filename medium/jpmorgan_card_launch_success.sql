-- Problem: Card Launch Success
-- Platform: DataLemur
-- Link: https://datalemur.com/questions/card-launch-success

WITH ranked_date AS (
  SELECT card_name,
    issued_amount,
    MAKE_DATE(issue_year,issue_month,1) AS issue_date,
    ROW_NUMBER() OVER (PARTITION BY card_name
      ORDER BY MAKE_DATE(issue_year,issue_month,1)) AS date_rank
  FROM monthly_cards_issued
)

SELECT card_name,
  issued_amount
FROM ranked_date
WHERE date_rank = 1
ORDER BY issued_amount DESC
