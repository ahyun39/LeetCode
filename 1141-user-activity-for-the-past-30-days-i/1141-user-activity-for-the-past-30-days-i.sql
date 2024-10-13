WITH activity_cnt AS (
    SELECT user_id, activity_date, COUNT(1) AS cnt
    FROM Activity
    GROUP BY user_id, activity_date
)

SELECT activity_date AS day, COUNT(DISTINCT user_id) AS active_users
FROM activity_cnt
WHERE cnt >= 1 AND activity_date BETWEEN DATE '2019-06-28' AND DATE '2019-07-27'
GROUP BY activity_date;
