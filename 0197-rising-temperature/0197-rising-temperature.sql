SELECT A.id
FROM Weather A LEFT JOIN 
    (SELECT id, 
            LAG(recordDate, 1) OVER(ORDER BY recordDate) AS yesterday, 
            LAG(temperature, 1) OVER(ORDER BY recordDate) AS prev_temp 
     FROM Weather) B ON A.id = B.id
WHERE temperature > B.prev_temp AND B.yesterday = recordDate - 1;