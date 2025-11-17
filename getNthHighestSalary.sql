CREATE FUNCTION getNthHighestSalary(@N INT) RETURNS INT AS
BEGIN
    RETURN (
        /* Write your T-SQL query statement below. */
        select i2.Salary from (select i1.Salary, ROW_NUMBER() OVER (ORDER BY i1.Salary DESC) as 'ranks' from
		
		(select Distinct Salary from Employee) as i1 ) as i2 where i2.ranks = @N
    );
END
