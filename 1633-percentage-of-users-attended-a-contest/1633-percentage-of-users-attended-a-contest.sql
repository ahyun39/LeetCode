WITH user_cnt AS (
    SELECT COUNT(1) AS total_count
    FROM Users
)

SELECT contest_id, ROUND(COUNT(DISTINCT user_id) / (SELECT total_count FROM user_cnt) ::decimal * 100 ,2) AS percentage
FROM Register
GROUP BY contest_id
ORDER BY percentage DESC, contest_id;
