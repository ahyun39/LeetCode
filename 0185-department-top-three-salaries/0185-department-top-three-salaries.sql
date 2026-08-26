SELECT Department, Employee, Salary
FROM(
    SELECT B.name Department, A.name Employee, A.salary Salary, DENSE_RANK() OVER (PARTITION BY A.departmentId ORDER BY salary DESC) AS rnk
    FROM Employee A LEFT JOIN Department B ON A.departmentId = B.id
) AS C
WHERE rnk <= 3
;