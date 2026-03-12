drop table if exists Person;
Create table If Not Exists Person (Id int, Email varchar(255));
Truncate table Person;
insert into Person (id, email) values ('1', 'john@example.com');
insert into Person (id, email) values ('2', 'bob@example.com');
insert into Person (id, email) values ('3', 'john@example.com');

delete from Person p1
using Person p2
where p1.email = p2.email
and p1.id > p2.id

select * from Person
