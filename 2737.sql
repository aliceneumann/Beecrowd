create table lawyers(
	register integer primary key,
	name varchar,
	customers_number integer
);

insert into lawyers(register, name, customers_number)
values(1648, 'Marty M. Harrison', 5), (2427, 'Jonathan J. Blevins', 15), (3365, 'Chelsey D. Sanders', 20),
(4153, 'Dorothy W. Ford', 16), (5525, 'Penny J. Cormier', 6);

select name, customers_number
from lawyers
where customers_number = (select max(customers_number) from lawyers)

union all

select name, customers_number
from lawyers
where customers_number = (select min(customers_number) from lawyers)

union all

select 'Average', cast(avg(customers_number) as int)
from lawyers
