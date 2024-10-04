WITH direct AS(
    SELECT managerId, SUM(1) AS manage_cnt
    FROM Employee
    WHERE managerId IS NOT NULL
    GROUP BY managerId)

SELECT A.name
FROM Employee A LEFT JOIN direct B ON A.id = B.managerID
WHERE B.manage_cnt >= 5;