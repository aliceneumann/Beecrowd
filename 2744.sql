create table account(
	id integer primary key,
	name varchar,
	login varchar,
	password varchar
);

insert into account(id, name, login, password)
values(1, 'Joyce P. Parry', 'Promeraw', 'noh1Oozei'), 
(2, 'Michael T. Gonzalez', 'Phers1942', 'Iath3see9bi'), 
(3, 'Heather W. Lawless', 'Hankicht', 'diShono4'), 
(4, 'Otis C. Hitt', 'Conalothe', 'zooFohH7w'), 
(5, 'Roger N. Brownfield', 'Worseente', 'fah7ohNg');

select id, password, md5(password) as MD5
from account;
