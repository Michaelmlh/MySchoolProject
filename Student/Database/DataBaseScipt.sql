USE [master]
GO
/****** Object:  Database [myproject]    Script Date: 2018/10/6 20:30:10 ******/
CREATE DATABASE [myproject]
/* CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = 'myproject', FILENAME = 'C:\Users\user\Desktop\database' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = 'myproject_log', FILENAME = 'C:\Users\user\Desktop\database' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )*/
GO
ALTER DATABASE [myproject] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [myproject].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [myproject] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [myproject] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [myproject] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [myproject] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [myproject] SET ARITHABORT OFF 
GO
ALTER DATABASE [myproject] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [myproject] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [myproject] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [myproject] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [myproject] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [myproject] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [myproject] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [myproject] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [myproject] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [myproject] SET  ENABLE_BROKER 
GO
ALTER DATABASE [myproject] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [myproject] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [myproject] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [myproject] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [myproject] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [myproject] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [myproject] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [myproject] SET RECOVERY FULL 
GO
ALTER DATABASE [myproject] SET  MULTI_USER 
GO
ALTER DATABASE [myproject] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [myproject] SET DB_CHAINING OFF 
GO
ALTER DATABASE [myproject] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [myproject] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
/*ALTER DATABASE [myproject] SET DELAYED_DURABILITY = DISABLED */
GO
EXEC sys.sp_db_vardecimal_storage_format N'myproject', N'ON'
GO
/*ALTER DATABASE [myproject] SET QUERY_STORE = OFF*/
GO
USE [myproject]
GO
/****** Object:  Table [dbo].[classes]    Script Date: 2018/10/6 20:30:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[classes](
	[classid] [varchar](9) NOT NULL,
	[classname] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[classid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[student]    Script Date: 2018/10/6 20:30:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[student](
	[studentid] [char](9) NOT NULL,
	[name] [char](10) NOT NULL,
	[sex] [char](2) NOT NULL,
	[birthday] [date] NULL,
	[nation] [varchar](15) NULL,
	[enrollmentyear] [date] NOT NULL,
	[contactway] [varchar](20) NOT NULL,
	[classid] [varchar](9) NULL,
	[dormid] [char](7) NULL,
	[bedid] [char](2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[studentid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[dormid] ASC,
	[bedid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_S_C]    Script Date: 2018/10/6 20:30:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create View [dbo].[View_S_C]
as
	SELECT   dbo.classes.classid, dbo.classes.classname, dbo.student.studentid, dbo.student.name, dbo.student.enrollmentyear, dbo.student.contactway, dbo.student.dormid,  dbo.student.bedid
	FROM      dbo.classes INNER JOIN
									dbo.student ON dbo.classes.classid = dbo.student.classid
GO
/****** Object:  Table [dbo].[dorm]    Script Date: 2018/10/6 20:30:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dorm](
	[dormid] [char](7) NOT NULL,
	[peoplenum] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[dormid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_S_R]    Script Date: 2018/10/6 20:30:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create View [dbo].[View_S_R]
as
	SELECT    dbo.student.studentid, dbo.student.contactway, dbo.student.classid, dbo.student.bedid, dbo.dorm.peoplenum, dbo.student.name, 
dbo.dorm.dormid
	FROM      dbo.student INNER JOIN
									dbo.dorm ON dbo.student.dormid = dbo.dorm.dormid
GO
/****** Object:  Table [dbo].[dormhealth]    Script Date: 2018/10/6 20:30:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dormhealth](
	[dormid] [char](7) NOT NULL,
	[checkdate] [date] NOT NULL,
	[electricityandsmell] [int] NULL,
	[ground] [int] NULL,
	[desk] [int] NULL,
	[bed] [int] NULL,
	[washtable] [int] NULL,
	[toilet] [int] NULL,
	[balcony] [int] NULL,
	[totalscore]  AS (((((([electricityandsmell]+[ground])+[desk])+[bed])+[washtable])+[toilet])+[balcony]),
	[note] [char](150) NULL,
	[rectificationornot] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[dormid] ASC,
	[checkdate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[limit]    Script Date: 2018/10/6 20:30:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[limit](
	[username] [varchar](15) NOT NULL,
	[password] [varchar](15) NOT NULL,
	[name] [char](10) NOT NULL,
	[level] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[dormhealth]  WITH CHECK ADD FOREIGN KEY([dormid])
REFERENCES [dbo].[dorm] ([dormid])
GO
ALTER TABLE [dbo].[student]  WITH CHECK ADD FOREIGN KEY([classid])
REFERENCES [dbo].[classes] ([classid])
GO
ALTER TABLE [dbo].[student]  WITH CHECK ADD FOREIGN KEY([dormid])
REFERENCES [dbo].[dorm] ([dormid])
GO
/****** Object:  Trigger [dbo].[power_in_up]    Script Date: 2018/10/6 20:30:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create trigger [dbo].[power_in_up]
	on [myproject].[dbo].[limit]
	for insert,update
	as
		if(select level  from inserted)not in ('学生','班级负责人','卫生检查员','系统管理员')
		begin
			raiserror('不合理权限名',16,1)
			rollback
		end
	return
GO
ALTER TABLE [dbo].[limit] ENABLE TRIGGER [power_in_up]
GO
/****** Object:  Trigger [dbo].[bedid_insert]    Script Date: 2018/10/6 20:30:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create trigger [dbo].[bedid_insert]
	on [myproject].[dbo].[student]
	for insert,update
	as
		if (select bedid from inserted) >(select peoplenum from dorm,inserted where dorm.dormid=inserted.dormid )
		begin
			raiserror('床位号大于宿舍可容纳人数',16,1)
			rollback
		end		 
	return
GO
ALTER TABLE [dbo].[student] ENABLE TRIGGER [bedid_insert]
GO
/****** Object:  Trigger [dbo].[student_delete]    Script Date: 2018/10/6 20:30:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [dbo].[student_delete]
	on [myproject].[dbo].[student]
	for delete
	as
		declare @no char(9)
		select @no=deleted.studentid
			from deleted
		delete from limits
			where username=@no
	return
GO
ALTER TABLE [dbo].[student] ENABLE TRIGGER [student_delete]
GO
/****** Object:  Trigger [dbo].[student_insert]    Script Date: 2018/10/6 20:30:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[student_insert]
ON [dbo].[student]
WITH EXECUTE AS CALLER
AFTER INSERT
AS
insert into myproject.dbo.limit (username,password,name,level)
			select s.studentid,s.name,s.studentid,'学生'
			from student  s ,inserted
			where s.studentid = inserted.studentid
	return
GO
ALTER TABLE [dbo].[student] ENABLE TRIGGER [student_insert]
GO
USE [master]
GO
ALTER DATABASE [myproject] SET  READ_WRITE 
GO
