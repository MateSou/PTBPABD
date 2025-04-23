--Questão 01. Crie uma tabela pessoa com os campos ID, nome, 
--sobrenome e idade. Crie uma cláusula de checagem para o campo idade, impedindo que valores menores que 0 sejam 
--adicionados. 
create table pessoa (
	ID varchar(8) primary key,
	Nome varchar(20),
	sobreNome varchar(30),
	Idade int check (Idade >= 0)
);

/*Questão 02. Altere a tabela pessoa e crie uma restrição 
  utilizando a especificação unique 
 ( A1, A2, …, Am) para os campos ID, nome e sobrenome. */
alter table pessoa 
add constraint U_pessoa unique(ID, Nome, sobreNome);

/*Questão 03. Altere a coluna idade da tabela 
pessoa e garanta que ela não receba valores nulos.*/
alter table pessoa
alter column Idade int not null;

/*Questão 04. Crie uma tabela endereco com os campos ID e rua. 
 Adicione o campo endereco na tabela pessoa e 
 crie uma integridade referencial a partir deste campo 
 com a tabela endereco.*/
create table endereco (
	ID varchar(8) primary key,
	Rua varchar(25)
);

alter table pessoa
add endereco varchar(8);

alter table pessoa
add constraint fk_endereco foreign key (endereco) references endereco(ID);