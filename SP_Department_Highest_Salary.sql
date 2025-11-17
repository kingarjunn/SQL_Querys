--Department Highest Salary
/*
Create table  Employee (id int, name varchar(255), salary int, departmentId int)
Create table  Department (id int, name varchar(255))
Truncate table Employee
insert into Employee (id, name, salary, departmentId) values ('1', 'Joe', '70000', '1')
insert into Employee (id, name, salary, departmentId) values ('2', 'Jim', '90000', '1')
insert into Employee (id, name, salary, departmentId) values ('3', 'Henry', '80000', '2')
insert into Employee (id, name, salary, departmentId) values ('4', 'Sam', '60000', '2')
insert into Employee (id, name, salary, departmentId) values ('5', 'Max', '90000', '1')
Truncate table Department
insert into Department (id, name) values ('1', 'IT')
insert into Department (id, name) values ('2', 'Sales')
*/
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
