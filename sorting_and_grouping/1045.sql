-- drop table Customer;
-- drop table Product;
-- Create table If Not Exists Customer (customer_id int, product_key int);
-- Create table Product (product_key int);
-- Truncate table Customer;
-- insert into Customer (customer_id, product_key) values ('1', '5');
-- insert into Customer (customer_id, product_key) values ('2', '6');
-- insert into Customer (customer_id, product_key) values ('3', '5');
-- insert into Customer (customer_id, product_key) values ('3', '6');
-- insert into Customer (customer_id, product_key) values ('1', '6');
-- Truncate table Product;
-- insert into Product (product_key) values ('5');
-- insert into Product (product_key) values ('6');

-- select * from Customer;
-- select * from Product;

select
	customer_id
from Customer
group by customer_id
having count(distinct product_key) = (select count(*) from Product);