create table candidate(
	id integer primary key,
	name varchar
);

create table score(
	candidate_id integer primary key,
	math numeric,
	specific numeric,
	project_plan numeric
);

insert into candidate(id, name) 
values(1, 'Michael P Cannon'), (2, 'Barbra J Cable'), (3, 'Ronald D Jones'), (4, '	Timothy K Fitzsimmons'), (5, 'Ivory B Morrison'),
(6, 'Sheila R Denis'), (7, 'Edward C Durgan'), (8, 'William K Spencer'), (9, 'Donna D Pursley'), (10, 'Ann C Davis');

insert into score(candidate_id, math, specific, project_plan)
values(1, 76, 58, 21), (2, 4, 5, 22), (3, 15, 59, 12), (4, 41, 42, 99), (5, 22, 90, 9), (6, 82, 77, 15), (7, 82, 99, 56), 
(8, 11, 4, 22), (9, 16, 29, 94), (10, 1, 7, 59);

select c.name, round(((s.math*2) + (s.specific*3) + (project_plan*5)) / 10, 2) as avg
from candidate as c 
join score as s on c.id = s.candidate_id
order by avg desc;
