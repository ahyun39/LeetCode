WITH rank_salary AS(
    SELECT id, salary, DENSE_RANK() OVER (ORDER BY salary DESC) AS rn
    FROM Employee
) 

SELECT MAX(salary) SecondHighestSalary
FROM rank_salary
WHERE rn = 2;
