create table users (
	id numeric primary key,
	name varchar(50),
	address varchar(50)
);

create table packages (
	id_package numeric primary key,
	id_user_sender integer references users(id),
	id_user_receiver integer references users(id),
	color varchar(50),
	year integer
);

insert into users(id, name, address) values
(1, 'Edgar Codd', 'England'),
(2, 'Peter Chen', 'Taiwan'),
(3, 'Jim Gray', 'United States'),
(4, 'Elizabeth O''Neil', 'United States');

insert into packages(id_package, id_user_sender, id_user_receiver, color, year) values
(1, 1, 2, 'blue', 2015),
(2, 1, 3, 'blue', 2019),
(3, 2, 4, 'red', 2019),
(4, 2, 1, 'green', 2018),
(5, 3, 4, 'red', 2015),
(6, 4, 3, 'blue', 2019);

select packages.year, sender.name as sender, receiver.name as receiver
from packages 
	join users sender on packages.id_user_sender = sender.id
	join users receiver on packages.id_user_receiver = receiver.id
where 
	(packages.color = 'blue' or packages.year = 2015) 
	and sender.address <> 'Taiwan'
	and receiver.address <> 'Taiwan'
order by packages.year desc;
