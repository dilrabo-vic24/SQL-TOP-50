-- Create table If Not Exists Logs (id int, num int);
-- Truncate table Logs;
-- insert into Logs (id, num) values ('1', '1');
-- insert into Logs (id, num) values ('2', '1');
-- insert into Logs (id, num) values ('3', '1');
-- insert into Logs (id, num) values ('4', '2');
-- insert into Logs (id, num) values ('5', '1');
-- insert into Logs (id, num) values ('6', '2');
-- insert into Logs (id, num) values ('7', '2');
-- select * from Logs

-- select
-- 	l1.num
-- from Logs l1
-- join Logs l2
-- 	on l1.id = l2.id - 1
-- join Logs l3
-- 	on l1.id = l3.id - 2
-- where l1.num = l2.num and l2.num = l3.num;

select distinct num as ConsecutiveNums
from (
	select num,
		lead(num, 1) over(order by id) as next1,
		lead(num, 2) over(order by id) as next2
	from Logs
) as subquery
where num = next1 and next1 = next2;