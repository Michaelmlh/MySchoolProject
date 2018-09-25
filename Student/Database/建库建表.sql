Use master
Create Database Student
	On		(Name=student
			,Filename='D:\datafile\数据库\课程设计\studentdata.mdf'
			,Size=10
			,Maxsize=150
			,FileGrowth=5%
			)
	Log On	(Name=studentlog
			,Filename='D:\datafile\数据库\课程设计\studentlog.ldf'
			,size=5
			,Maxsize=30
			,FileGrowth=10
			)

Use Student
Create Table 宿舍
	(宿舍号 char(7) primary key
	,人数 int not null
	)
Create Table 班级
	(班号 char(4) primary key
	,班名 varchar(20) not null
	)
Create Table 学生
	(学号 char(9) primary key
	,姓名 char(10) not null
	,性别 char(2) not null
	,出生日期 date 
	,民族 varchar(15) 
	,入学年份 date not null
	,联系方式 varchar(20) null
	,班号 char(4) foreign key references 班级
	,宿舍号 char(7) foreign key references 宿舍  
	,床位号 char(2) not null
	)
Create Table 权限
	(登录名 varchar(15) primary key
	,密码 varchar(15) not null
	,姓名 char(10) not null
	,权限级别 char(10) not null
	)
Create Table 宿舍卫生
	(宿舍号 char(7) foreign key references 宿舍
	,检查日期 date not null
	,用电与气味 int 
	,地面 int 
	,书桌 int
	,床铺 int
	,洗漱台 int
	,卫生间 int
	,阳台 int
	,总分 as 用电与气味+地面+书桌+床铺+洗漱台+卫生间+阳台
	,备注 char(150) 
	,是否整改 bit not null
	primary key(宿舍号,检查日期)
	)
	alter table 学生
		add unique(宿舍号,床位号)

SELECT   dbo.班级.班号, dbo.班级.班名, dbo.学生.学号, dbo.学生.姓名, dbo.学生.入学年份, dbo.学生.联系方式, dbo.学生.宿舍号, 
                dbo.学生.床位号
FROM      dbo.班级 INNER JOIN
                dbo.学生 ON dbo.班级.班号 = dbo.学生.班号
SELECT    dbo.学生.学号, dbo.学生.联系方式, dbo.学生.班号, dbo.学生.床位号, dbo.宿舍.人数, dbo.学生.姓名, 
                dbo.宿舍.宿舍号
FROM      dbo.学生 INNER JOIN
                dbo.宿舍 ON dbo.学生.宿舍号 = dbo.宿舍.宿舍号