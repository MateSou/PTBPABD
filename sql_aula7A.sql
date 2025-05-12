/*Questão 01. Crie um procedimento chamado student_grade_points segundo os critérios abaixo:

a. Utilize como parâmetro de entrada o conceito. Exemplo: A+, A-, ...

b. Retorne os atributos das tuplas: Nome do estudante, Departamento do estudante, Título do curso, 
Departamento do curso, Semestre do curso, Ano do curso, Pontuação alfanumérica, Pontuação numérica.

c. Filtre as tuplas utilizando o parâmetro de entrada.
*/
create procedure studen_grade_points @Conceito varchar(3)
as
 select s.name as [Nome do Estudante], s.dept_name as [Departamento do Estudante],
			 		c.title [Curso], c.dept_name [Departamento do Curso], t.semester as [Semestre],
			 		t.year as [Ano], t.grade [Pontuação Alfanumérica], gp.points as [Pontuação Numérica]
			 from takes t
			 right join student s on s.ID = t.ID
			 left join course c on c.course_id = t.course_id
			 left join grade_points gp on gp.grade = t.grade
			 where t.grade = @Conceito;


/*Questão 02.

Crie uma função chamada return_instructor_location segundo os critérios abaixo:

a. Utilize como parâmetro de entrada o nome do instrutor.

b. Retorne os atributos das tuplas: Nome do instrutor, Curso ministrado, 
Semestre do curso, Ano do curso, prédio e número da sala na qual o curso foi
ministrado.

c. Exemplo: SELECT * FROM dbo.return_instructor_location('Gustafsson');
*/ 

create function return_instructor_location (@nameInstructor varchar(50)) 
returns table
as
return select i.name as [Nome do Instrutor], c.title as [Curso Ministrado],
			  t.semester as [Semestre do Curso], t.year as [Ano do Curso],
			  s.building as [Prédio], s.room_number as [Número da Sala]
		from instructor i
		right join teaches t on t.ID = i.ID
		left join section s on s.course_id = t.course_id
		right join course c on c.course_id = t.course_id
		where i.name = @nameInstructor;

	
