-- Problem: Investments in 2016
-- Platform: LeetCode
-- Link: https://leetcode.com/problems/investments-in-2016

SELECT ROUND(SUM(tiv_2016)::DECIMAL,2) AS tiv_2016
FROM (SELECT tiv_2016,
        COUNT(*) OVER (PARTITION BY tiv_2015) AS same_tiv2015_count,
        COUNT(*) OVER (PARTITION BY lat, lon) AS same_location_count
    FROM Insurance
) AS t
WHERE same_tiv2015_count > 1 AND same_location_count = 1
