-- Problem: Acceptance Rate By Date
-- Platform: StrataScratch
-- Link: https://platform.stratascratch.com/coding/10285-acceptance-rate-by-date

SELECT sent.date, AVG (CASE WHEN accepted.action = 'accepted' THEN 1 ELSE 0 END) AS
    percentage_accpetance
FROM ( SELECT
        user_id_sender, user_id_receiver, date, action
    FROM fb_friend_requests
    WHERE action = 'sent'
) AS sent
LEFT JOIN ( SELECT
        user_id_sender, user_id_receiver, date, action
    FROM fb_friend_requests
    WHERE action = 'accepted'
) AS accepted USING (user_id_sender, user_id_receiver)
GROUP BY sent.date
