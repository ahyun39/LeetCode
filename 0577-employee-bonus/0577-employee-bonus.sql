SELECT A.name, B.bonus
FROM Employee A LEFT JOIN Bonus B ON A.empId = B.empId
WHERE bonus < 1000 OR bonus IS NULL;