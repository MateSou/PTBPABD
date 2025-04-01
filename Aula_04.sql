--Cria uma nova relação a partir da união das relações Student e Takes;
select * from student join takes on student.ID = takes.ID; 

-- Conta a quantidade de cursos feitos pelos alunos do Departamento de Engenharia Civil
select student.ID,student.name, count(takes.ID) as Quantidade_de_Curso 
from student 
join takes on student.ID = takes.ID 
where student.dept_name ='Civil Eng.'
group by student.ID,student.name 
order by Quantidade_de_Curso desc; 

-- Cria a view civil_eng_students
create view civil_eng_students as select student.ID,student.name, count(takes.ID) as Quantidade_de_Curso 
from student 
join takes on student.ID = takes.ID 
where student.dept_name ='Civil Eng.'
group by student.ID,student.name;
