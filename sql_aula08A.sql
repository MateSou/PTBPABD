/*Ao realizar um curso o aluno ganha créditos.

Ao eliminar um curso da lista do aluno, os seus créditos totais deverão ser reduzidos.
Construa uma 
Trigger chamada dbo.lost_credits que atualiza o valor de créditos de um aluno após a retirada de um curso da sua lista.
*/ 

create trigger dbo.lost_credits 
on dbo.takes
after delete as
if (rowcount_big() = 0)
	return;
begin
	update dbo.student
	set tot_cred = tot_cred - (select credits from dbo.course c inner join deleted d on c.course_id = d.course_id)
	where student.id = (select distinct id from deleted); 
	
end

-- testando --

--Aqui o estudante tem 41 creditos, após adicionar o curso 105
select tot_cred from student where student.id = '30299';

--Deletando o curso 105 do estudante com id 30299
delete from takes where course_id = '105' and ID = '30299';

--Aqui o estudante volta a ter 38 creditos, quantidade antes de adicionar o curso 105
select tot_cred from student where student.id = '30299';









