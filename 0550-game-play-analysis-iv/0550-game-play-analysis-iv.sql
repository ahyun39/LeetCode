WITH first_logins AS (
    SELECT player_id, MIN(event_date) AS first_login
    FROM Activity
    GROUP BY player_id
),
next_day_logins AS (
    SELECT A.player_id
    FROM first_logins A
    JOIN Activity B 
    ON A.player_id = B.player_id 
    AND B.event_date = A.first_login + INTERVAL '1 DAY'
)
SELECT ROUND(COUNT(next_day_logins.player_id) * 1.0 / COUNT(first_logins.player_id), 2) AS fraction
FROM first_logins
LEFT JOIN next_day_logins 
ON first_logins.player_id = next_day_logins.player_id;