--Questão 01. Crie as contas de usuário User_A, User_B, User_C, User_D e User_E.--
create user User_A with password = 'senha_A#';
create user User_B with password ='senha_B#';
create user User_C with password = 'senha_C#'; 
create user User_D with password = 'senha_D#';
create user User_E with password = 'senha_E#'; 


/*Questão 02. Considere o esquema de banco de dados relacional university.
O User_A poderá selecionar ou modificar qualquer relação, exceto CLASSROOM, e pode conceder qualquer um desses 
privilégios a outros 
usuários. */

--Dá todos os privilégios ao User_A, com a capacidade de também dar privilégios aos outros users.
grant all privileges on schema dbo to User_A with grant option; 

--Retira as permissões do User_A da tabela CLASSROM; 
deny select, insert, update, delete, alter on object::dbo.classroom to User_A;

--Questão 03. Liste as permissões do User_A.
select princ.name, 
	   princ.type_desc, 
       perm.permission_name,
       perm.state_desc,
       perm.class_desc, 
       object_name (perm.major_id)
from sys.database_principals princ
left join sys.database_permissions perm
on perm.grantee_principal_id = princ.principal_id
where princ.type_desc = 'SQL_USER'
order by princ.name; 
