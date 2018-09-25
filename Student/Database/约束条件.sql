Create trigger student_insert
	on Student.dbo.学生
	for insert
	as 
		insert into Student.dbo.权限 (登录名,密码,姓名,权限级别)
			select 学生.学号,学生.学号,学生.姓名,'学生'
				from Student.dbo.学生,inserted
				where 学生.学号=inserted.学号
	return

Create trigger power_in_up
	on 权限
	for insert,update
	as
		if(select 权限级别  from inserted)not in ('学生','班级负责人','卫生检查员','系统管理员')
		begin
			raiserror('不合理权限名',16,1)
			rollback
		end
	return
		
create trigger student_delete
	on 学生
	for delete
	as
		declare @no char(9)
		select @no=deleted.学号
			from deleted
		delete from 权限
			where 登录名=@no
	return
/*测试
delete from 学生 
delete from 权限 

insert into 学生(学号,姓名,入学年份)
	values('001','mlh','1999-1-1')
	*/
Create trigger 宿舍床号_insert
	on Student.dbo.学生
	for insert,update
	as
		if (select 床位号 from inserted) >(select 人数 from 宿舍,inserted where 宿舍.宿舍号=inserted.宿舍号 )
		begin
			raiserror('床位号大于宿舍可容纳人数',16,1)
			rollback
		end		 
	return
/*	
create trigger 宿舍卫生_整改次数_up
	on 宿舍卫生
	for update
	as
		declare @is char(2),@no char(9)
		if update (是否整改)
			begin
				select @is=是否整改,@no=宿舍号
					from inserted
				if @is=1
					update 宿舍  set 整改次数=整改次数+1 where 宿舍号=@no
				else if @is=0
					update 宿舍  set 整改次数=整改次数-1 where 宿舍号=@no
				return
			end
	return

create trigger 宿舍卫生_整改次数_in
	on 宿舍卫生
	for insert
	as
		declare @is char(2),@no char(9)
		select @is=是否整改,@no=宿舍号
			from inserted
		if @is=1
			update 宿舍  set 整改次数=整改次数+1 where 宿舍号=@no
	return

create trigger 宿舍卫生_整改次数_de
	on 宿舍卫生
	for delete
	as
		declare @is char(2),@no char(9)
		select @is=是否整改,@no=宿舍号
			from deleted
		if @is=1
			update 宿舍  set 整改次数=整改次数-1 where 宿舍号=@no
	return
	*/