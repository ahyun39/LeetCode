WITH max_salary AS (
    SELECT DISTINCT d.id, d.name, MAX(salary) OVER (PARTITION BY e.departmentId) AS max_sal
        FROM Employee e LEFT JOIN Department d ON e.departmentId = d.id
)

SELECT ms.name Department, e.name Employee, salary Salary
FROM Employee e LEFT JOIN max_salary ms ON e.departmentId = ms.id
WHERE salary = max_sal