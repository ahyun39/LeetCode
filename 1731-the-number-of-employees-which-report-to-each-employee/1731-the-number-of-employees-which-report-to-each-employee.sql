SELECT A.employee_id, A.name, COUNT(B.employee_id) AS reports_count, ROUND(AVG(B.age)) AS average_age
FROM Employees A
LEFT JOIN Employees B ON A.employee_id = B.reports_to
GROUP BY A.employee_id, A.name
HAVING AVG(B.age) IS NOT NULL
ORDER BY A.employee_id;