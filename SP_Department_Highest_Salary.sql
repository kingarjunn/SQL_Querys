--Department Highest Salary
/* Write your T-SQL query statement below */

select 
d.name as Department ,
ep.name as Employee,
ep.Salary
from
Employee ep
INNER JOIN Department d on d.id = ep.departmentId
INNER JOIN
(select 
d.id,
MAX(ep.salary) as Salary from 
Employee ep
INNER JOIN Department d on d.id = ep.departmentId
Group by
d.id) as lst on lst.id = ep.departmentId
where ep.salary = lst.Salary
