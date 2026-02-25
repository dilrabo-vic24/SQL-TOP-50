CREATE TYPE transaction_state AS ENUM ('approved', 'declined');

Create table If Not Exists Transactions (id int, country varchar(4), state transaction_state, amount int, trans_date date);
Truncate table Transactions;
insert into Transactions (id, country, state, amount, trans_date) values ('121', 'US', 'approved', '1000', '2018-12-18');
insert into Transactions (id, country, state, amount, trans_date) values ('122', 'US', 'declined', '2000', '2018-12-19');
insert into Transactions (id, country, state, amount, trans_date) values ('123', 'US', 'approved', '2000', '2019-01-01');
insert into Transactions (id, country, state, amount, trans_date) values ('124', 'DE', 'approved', '2000', '2019-01-07');

select * from Transactions;

select
	to_char(trans_date, 'YYYY-MM') as month,
	country,
	count(*) as trans_count,
	sum(
		case
			when state = 'approved' 
		then 1 else 0 end
	) as approved_count,
	sum(amount) as trans_total_amount ,
	sum(
		case
			when state = 'approved'
		then amount else 0 end
	) as approved_total_amount
from Transactions
group by month, country;