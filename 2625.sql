create table natural_person(
	id_customers numeric primary key,
	cpf char(14)
);

select * from natural_person;

insert into natural_person(id_customers, cpf)
values(1, '26774287840'), (2, '97918477200');

select substring(cpf, 1, 3) || '.' || substring(cpf, 4, 3) || '.' || substring(cpf, 7, 3) || '-' || substring(cpf, 10) as CPF
from natural_person;
