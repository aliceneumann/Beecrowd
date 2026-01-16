create table teams(
	id integer primary key,
	name varchar(50)
);

create table matches(
	id integer primary key,
	team_1 integer references teams(id),
	team_2 integer references teams(id),
	team_1_goals integer,
	team_2_goals integer
);

select * from teams; select * from matches;

insert into teams(id, name) values(1, 'CEARA'), (2, 'FORTALEZA'), (3, 'GUARANY DE SOBRAL'), (4, 'FLORESTA');
insert into matches(id, team_1, team_2, team_1_goals, team_2_goals)
values(1, 4, 1, 0, 4), (2, 3, 2, 0, 1), (3, 1, 3, 3, 0), (4, 3, 4, 0, 1), (5, 1, 2, 0, 0), (6, 2, 4, 2, 1);

select teams.name, count(matches.team_1) as matches,
	sum(
		case
			when teams.id = matches.team_1 
				and matches.team_1_goals > matches.team_2_goals then 1
			when teams.id = matches.team_2 
				and matches.team_2_goals > matches.team_1_goals then 1
			else 0
		end
	) as victories,
	sum(
		case
			when teams.id = matches.team_1 
				and matches.team_1_goals < matches.team_2_goals then 1
			when teams.id = matches.team_2 
				and matches.team_2_goals < matches.team_1_goals then 1
			else 0
		end
	) as defeats,
	sum(
		case
			when teams.id = matches.team_1 
				and matches.team_1_goals = matches.team_2_goals then 1
			when teams.id = matches.team_2 
				and matches.team_2_goals = matches.team_1_goals then 1
			else 0
		end
	) as draws,
	sum(
		case
			when teams.id = matches.team_1 and matches.team_1_goals > matches.team_2_goals then 3
			when teams.id = matches.team_1 and matches.team_1_goals = matches.team_2_goals then 1
			
			when teams.id = matches.team_2 and matches.team_2_goals > matches.team_1_goals then 3
			when teams.id = matches.team_2 and matches.team_2_goals = matches.team_1_goals then 1
			else 0
		end
	) as score
from teams inner join matches on teams.id = matches.team_1 or teams.id = matches.team_2
group by teams.name, teams.id
order by score desc, teams.name;
