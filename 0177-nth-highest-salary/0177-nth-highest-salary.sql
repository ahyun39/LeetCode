CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
      WITH rank_salary AS(
        SELECT *, DENSE_RANK() OVER (ORDER BY salary DESC) rn
        FROM Employee
      )
      SELECT MAX(salary)
      FROM rank_salary
      WHERE rn = N
  );
END