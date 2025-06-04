/*Crie uma Trigger denominada dbo.trigger_prevent_assignment_teaches para impedir que aulas sejam atribuidas a um instrutor 
que já possui 2 ou mais atribuições no ano.*/
create trigger dbo.trigger_prevent_assignment_teaches
on dbo.teaches
after insert as
if (rowcount_big() = 0)
	return;
begin
	if exists (
		select 1
		from teaches t
		where t.ID in (select ID from inserted)
		group by t.ID
		having count(t.course_id) >= 2
	)
	begin
		print 'Professor já possui duas atribuições no ano';
		rollback;
	end
	
end;

