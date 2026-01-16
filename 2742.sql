create table dimensions(
	id integer primary key,
	name varchar(30)
);

insert into dimensions(id, name)
values(1, 'C774'), (2, 'C784'), (3, 'C794'), (4, 'C824'), (5, 'C875');

select * from dimensions;

create table life_registry(
	id integer primary key,
	name varchar(30),
	omega numeric,
	dimensions_id integer references dimensions(id)
);

insert into life_registry (id, name, omega, dimensions_id)
values(1, 'Richard Postman', 5.6, 2), (2, 'Simple Jelly', 1.4, 1), 
(3, 'Richard Grand Master', 2.5, 1), (4, 'Richard Turing', 6.4, 4), (5, 'Richard Strall', 1.0, 3);

select * from life_registry;

select life_registry.name, (life_registry.omega * 1.618)::numeric(10, 3) as "Fator N"
from life_registry inner join dimensions on dimensions.id = life_registry.dimensions_id
where life_registry.name like 'Richard%' and dimensions.name in('C774','C875')
order by life_registry.omega;
