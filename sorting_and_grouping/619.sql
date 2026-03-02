-- Create table If Not Exists MyNumbers (num int);
-- Truncate table MyNumbers;
-- insert into MyNumbers (num) values ('8');
-- insert into MyNumbers (num) values ('8');
-- insert into MyNumbers (num) values ('3');
-- insert into MyNumbers (num) values ('3');
-- insert into MyNumbers (num) values ('1');
-- insert into MyNumbers (num) values ('4');
-- insert into MyNumbers (num) values ('5');
-- insert into MyNumbers (num) values ('6');

-- select * from MyNumbers

select max(num) as num from (select
	num
from MyNumbers
group by num
having count(num) = 1);