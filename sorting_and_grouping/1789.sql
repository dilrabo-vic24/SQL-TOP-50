
create type flag_type as ENUM('Y','N');
Create table If Not Exists Employee (employee_id int, department_id int, primary_flag flag_type);
Truncate table Employee;
insert into Employee (employee_id, department_id, primary_flag) values ('1', '1', 'N');
insert into Employee (employee_id, department_id, primary_flag) values ('2', '1', 'Y');
insert into Employee (employee_id, department_id, primary_flag) values ('2', '2', 'N');
insert into Employee (employee_id, department_id, primary_flag) values ('3', '3', 'N');
insert into Employee (employee_id, department_id, primary_flag) values ('4', '2', 'N');
insert into Employee (employee_id, department_id, primary_flag) values ('4', '3', 'Y');
insert into Employee (employee_id, department_id, primary_flag) values ('4', '4', 'N');

select * from Employee;

with cte as (
	select
		*,
		count(primary_flag) over(partition by employee_id) as cnt
	from Employee
)
select employee_id, department_id
from cte
where (cnt = 1) or (cnt > 1 and primary_flag = 'Y')



