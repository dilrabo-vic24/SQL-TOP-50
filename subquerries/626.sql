-- Create table If Not Exists Seat (id int, student varchar(255));
-- Truncate table Seat;
-- insert into Seat (id, student) values ('1', 'Abbot');
-- insert into Seat (id, student) values ('2', 'Doris');
-- insert into Seat (id, student) values ('3', 'Emerson');
-- insert into Seat (id, student) values ('4', 'Green');
-- insert into Seat (id, student) values ('5', 'Jeames');

select
	case
		when id % 2 = 1 and id != (select max(id) from Seat) then id + 1
		when id % 2 = 0 then id - 1
		else id
	end,
	student
from Seat
order by id



