-- Problem: FAANG Stock Min-Max (Part 1)
-- Platform: DataLemur
-- Link: https://datalemur.com/questions/sql-bloomberg-stock-min-max-1

WITH stock_open_price AS(
  SELECT ticker,
    TO_CHAR(date, 'Mon-YYYY') AS mth,
    MAX(open) AS highest_open,
    MIN(open) AS lowest_open
  FROM stock_prices
  GROUP BY ticker, mth
),

price_rank AS (
  SELECT ticker,
    mth,
    highest_open,
    lowest_open,
    ROW_NUMBER() OVER (PARTITION BY ticker ORDER BY highest_open DESC) AS rank_high,
    ROW_NUMBER() OVER (PARTITION BY ticker ORDER BY lowest_open) AS rank_low
  FROM stock_open_price
)

SELECT ticker,
  h.mth AS highest_month,
  h.highest_open,
  l.mth AS lowest_mth,
  l.lowest_open
FROM (SELECT * FROM price_rank WHERE rank_high = 1) AS h
JOIN (SELECT * FROM price_rank WHERE rank_low = 1) AS l USING (ticker)
