create table league(
	position integer primary key,
	team varchar
);

insert into league(position, team)
values (1,'The Quack Bats'), (2,'The Responsible Hornets'), (3,'The Bawdy Dolphins'), (4,'The Abstracted Sharks'), 
(5,'The Nervous Zebras'), (6,'The Oafish Owls'), (7,'The Unequaled Bison'), (8,'The Keen Kangaroos'), (9,'The Left Nightingales'), 
(10,'The Terrific Elks'), (11,'The Lumpy Frogs'), (12,'The Swift Buffalo'), (13,'The Swift Buffalo'), (14,'The Rough Robins'), (15,'The Silver Crocs');

select
    case 
        when position in(1, 2, 3) then 'Podium: ' || team
        when position in(14, 15) then 'Demoted: ' || team
    end as name
from league
where position in (1, 2, 3, 14, 15)
order by position;
