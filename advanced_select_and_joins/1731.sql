-- drop table Employees;
-- Create table If Not Exists Employees(employee_id int, name varchar(20), reports_to int, age int);
-- Truncate table Employees;
-- insert into Employees (employee_id, name, reports_to, age) values ('9', 'Hercy', NULL, '43');
-- insert into Employees (employee_id, name, reports_to, age) values ('6', 'Alice', '9', '41');
-- insert into Employees (employee_id, name, reports_to, age) values ('4', 'Bob', '9', '36');
-- insert into Employees (employee_id, name, reports_to, age) values ('2', 'Winston', NULL, '37');

-- select * from Employees;

select
	e2.employee_id,
	e2.name,
	count(*) as reports_count,
	round(avg(e1.age)) as average_age
from Employees e1
join Employees e2
	on e1.reports_to = e2.employee_id
group by e2.employee_id, e2.name
order by e2.employee_id





