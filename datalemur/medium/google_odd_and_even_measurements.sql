-- Problem: Odd and Even Measurements
-- Platform: DataLemur
-- Link: https://datalemur.com/questions/odd-even-measurements

WITH measurement_rank AS (
  SELECT CAST(measurement_time AS DATE) AS measurement_day,
    measurement_value,
    ROW_NUMBER() OVER (
      PARTITION BY CAST(measurement_time AS DATE)
      ORDER BY measurement_time) AS measurement_number
  FROM measurements
)

SELECT measurement_day,
  SUM(measurement_value) FILTER (WHERE measurement_number % 2 = 1) AS odd_sum,
  SUM(measurement_value) FILTER (WHERE measurement_number % 2 = 0) AS even_sum
FROM measurement_rank
GROUP BY measurement_day
