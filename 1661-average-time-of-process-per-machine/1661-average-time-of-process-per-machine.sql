WITH take_time AS(
    SELECT machine_id, process_id, SUM(CASE WHEN activity_type = 'start' THEN -1 * timestamp ELSE timestamp END)
    FROM Activity
    GROUP BY machine_id, process_id
)

SELECT machine_id, ROUND(AVG(sum) ::decimal, 3) AS processing_time
FROM take_time
GROUP BY machine_id;
    