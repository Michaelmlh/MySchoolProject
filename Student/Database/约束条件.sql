Create trigger student_insert
	on Student.dbo.ѧ��
	for insert
	as 
		insert into Student.dbo.Ȩ�� (��¼��,����,����,Ȩ�޼���)
			select ѧ��.ѧ��,ѧ��.ѧ��,ѧ��.����,'ѧ��'
				from Student.dbo.ѧ��,inserted
				where ѧ��.ѧ��=inserted.ѧ��
	return

Create trigger power_in_up
	on Ȩ��
	for insert,update
	as
		if(select Ȩ�޼���  from inserted)not in ('ѧ��','�༶������','�������Ա','ϵͳ����Ա')
		begin
			raiserror('������Ȩ����',16,1)
			rollback
		end
	return
		
create trigger student_delete
	on ѧ��
	for delete
	as
		declare @no char(9)
		select @no=deleted.ѧ��
			from deleted
		delete from Ȩ��
			where ��¼��=@no
	return
/*����
delete from ѧ�� 
delete from Ȩ�� 

insert into ѧ��(ѧ��,����,��ѧ���)
	values('001','mlh','1999-1-1')
	*/
Create trigger ���ᴲ��_insert
	on Student.dbo.ѧ��
	for insert,update
	as
		if (select ��λ�� from inserted) >(select ���� from ����,inserted where ����.�����=inserted.����� )
		begin
			raiserror('��λ�Ŵ����������������',16,1)
			rollback
		end		 
	return
/*	
create trigger ��������_���Ĵ���_up
	on ��������
	for update
	as
		declare @is char(2),@no char(9)
		if update (�Ƿ�����)
			begin
				select @is=�Ƿ�����,@no=�����
					from inserted
				if @is=1
					update ����  set ���Ĵ���=���Ĵ���+1 where �����=@no
				else if @is=0
					update ����  set ���Ĵ���=���Ĵ���-1 where �����=@no
				return
			end
	return

create trigger ��������_���Ĵ���_in
	on ��������
	for insert
	as
		declare @is char(2),@no char(9)
		select @is=�Ƿ�����,@no=�����
			from inserted
		if @is=1
			update ����  set ���Ĵ���=���Ĵ���+1 where �����=@no
	return

create trigger ��������_���Ĵ���_de
	on ��������
	for delete
	as
		declare @is char(2),@no char(9)
		select @is=�Ƿ�����,@no=�����
			from deleted
		if @is=1
			update ����  set ���Ĵ���=���Ĵ���-1 where �����=@no
	return
	*/