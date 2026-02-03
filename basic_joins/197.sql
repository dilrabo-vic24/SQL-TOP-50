Create table If Not Exists Weather (id int, recordDate date, temperature int);
Truncate table Weather;
insert into Weather (id, recordDate, temperature) values ('1', '2015-01-01', '10');
insert into Weather (id, recordDate, temperature) values ('2', '2015-01-02', '25');
insert into Weather (id, recordDate, temperature) values ('3', '2015-01-03', '20');
insert into Weather (id, recordDate, temperature) values ('4', '2015-01-04', '30');

--Solution 1
select
	w1.id
from Weather w1
join Weather w2
	on w1.recordDate = w2.recordDate + Interval '1 day'
where w1.temperature > w2.temperature

--Solution 2
select
	t.id
from (select
	id,
	recordDate,
	temperature,
	lag(recordDate) over (order by recordDate) as prevDate,
	lag(temperature) over (order by recordDate) as prevTemp
from Weather)t
where t.temperature > t.prevTemp
	and t.recordDate = t.prevDate + interval '1 day'