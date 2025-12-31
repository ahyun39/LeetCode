WITH ban_users AS(
    SELECT users_id
    FROM Users
    WHERE banned = 'Yes'
)

SELECT request_at AS Day,
        ROUND(
            SUM(CASE WHEN status != 'completed' THEN 1 ELSE 0 END) / SUM(1), 2
        ) AS 'Cancellation Rate'
FROM Trips
WHERE (client_id NOT IN (SELECT * FROM ban_users))
    AND (driver_id NOT IN (SELECT * FROM ban_users))
    AND (request_at BETWEEN '2013-10-01' AND '2013-10-03')
GROUP BY request_at;