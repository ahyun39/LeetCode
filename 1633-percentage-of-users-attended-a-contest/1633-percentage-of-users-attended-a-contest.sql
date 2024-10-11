SELECT contest_id, 
       ROUND(COUNT(DISTINCT user_id) / (SELECT COUNT(1) FROM Users)::decimal * 100, 2) AS percentage
FROM Register
GROUP BY contest_id
ORDER BY percentage DESC, contest_id;