SELECT A.name Employee
FROM Employee A JOIN Employee B ON A.managerId = B.id
WHERE A.salary > B.salary;