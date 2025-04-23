/*Questão 02. Crie a tabela company com os atributos company_name e city.
Utilize a restrição not null para o atributo company_name.
O atributo company_name deverá ser uma chave primária.*/

create table avaliacaocontinua.company (
	company_name varchar(255) primary key,
	city varchar(255) not null
);

/*Questão 03. Crie a tabela employee com os atributos person_name, street e city.
Utilize a restrição not null para o atributo person_name.
O atributo person_name deverá ser uma chave primária.*/
create table avaliacaocontinua.employee (
	person_name varchar(255) primary key not null,
	street varchar(255),
	city varchar(255)
);

/*Questão 04. Crie a tabela manages com os atributos person_name e manager_name.
Utilize a restrição not null para o atributo person_name.
O atributo person_name deverá ser uma chave primária.*/
create table avaliacaocontinua.manages (
	person_name varchar(255) primary key not null,
	manager_name varchar(255)
);

/*Questão 05. Crie a tabela works com os atributos person_name, company_name e salary.
Utilize a restrição not null para o atributo person_name e company_name.
O atributo person_name deverá ser uma chave primária.*/
create table avaliacaocontinua.works (
	person_name varchar(255) primary key not null,
	company_name varchar(255) not null,
	salary real
);

/* Crie a integridade referencial entre a relação works e a relação employee.
O atributo person_name da relação works deverá existir na relação employee.
Utilize as ações em cascata: update e delete.*/
alter table avaliacaocontinua.works 
add constraint wks_fk foreign key (person_name) references avaliacaocontinua.employee(person_name)
on update cascade
on delete cascade;

/*Questão 07. Crie a integridade referencial entre a relação works e a relação company.
O atributo company_name da relação works deverá existir na relação company.
Utilize as ações em cascata: update e delete.*/
alter table avaliacaocontinua.works
add constraint wks01_fk foreign key (company_name) references avaliacaocontinua.company(company_name)
on update cascade
on delete cascade;

/*Questão 08. Crie a integridade referencial entre a relação manages e a relação employee.
O atributo person_name da relação manages deverá existir na relação employee.
Utilize as ações em cascata: update e delete.*/
alter table avaliacaocontinua.manages 
add constraint man_fk foreign key (person_name) references avaliacaocontinua.employee(person_name)
on update cascade
on delete cascade;
