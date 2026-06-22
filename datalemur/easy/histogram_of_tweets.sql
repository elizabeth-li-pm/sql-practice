-- Problem: Histogram of Tweets
-- Platform: DataLemur
-- Link: https://datalemur.com/questions/sql-histogram-tweets

SELECT
    tweets_posted AS tweet_bucket,
    COUNT(user_id) AS users_num
FROM (SELECT
    user_id,
    COUNT(msg) AS tweets_posted
    FROM tweets
    WHERE YEAR(tweet_date) = 2022
    GROUP BY user_id
) AS t
GROUP BY tweets_posted
ORDER BY tweet_bucket
