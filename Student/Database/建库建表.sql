Use master
Create Database Student
	On		(Name=student
			,Filename='D:\datafile\���ݿ�\�γ����\studentdata.mdf'
			,Size=10
			,Maxsize=150
			,FileGrowth=5%
			)
	Log On	(Name=studentlog
			,Filename='D:\datafile\���ݿ�\�γ����\studentlog.ldf'
			,size=5
			,Maxsize=30
			,FileGrowth=10
			)

Use Student
Create Table ����
	(����� char(7) primary key
	,���� int not null
	)
Create Table �༶
	(��� char(4) primary key
	,���� varchar(20) not null
	)
Create Table ѧ��
	(ѧ�� char(9) primary key
	,���� char(10) not null
	,�Ա� char(2) not null
	,�������� date 
	,���� varchar(15) 
	,��ѧ��� date not null
	,��ϵ��ʽ varchar(20) null
	,��� char(4) foreign key references �༶
	,����� char(7) foreign key references ����  
	,��λ�� char(2) not null
	)
Create Table Ȩ��
	(��¼�� varchar(15) primary key
	,���� varchar(15) not null
	,���� char(10) not null
	,Ȩ�޼��� char(10) not null
	)
Create Table ��������
	(����� char(7) foreign key references ����
	,������� date not null
	,�õ�����ζ int 
	,���� int 
	,���� int
	,���� int
	,ϴ��̨ int
	,������ int
	,��̨ int
	,�ܷ� as �õ�����ζ+����+����+����+ϴ��̨+������+��̨
	,��ע char(150) 
	,�Ƿ����� bit not null
	primary key(�����,�������)
	)
	alter table ѧ��
		add unique(�����,��λ��)

SELECT   dbo.�༶.���, dbo.�༶.����, dbo.ѧ��.ѧ��, dbo.ѧ��.����, dbo.ѧ��.��ѧ���, dbo.ѧ��.��ϵ��ʽ, dbo.ѧ��.�����, 
                dbo.ѧ��.��λ��
FROM      dbo.�༶ INNER JOIN
                dbo.ѧ�� ON dbo.�༶.��� = dbo.ѧ��.���
SELECT    dbo.ѧ��.ѧ��, dbo.ѧ��.��ϵ��ʽ, dbo.ѧ��.���, dbo.ѧ��.��λ��, dbo.����.����, dbo.ѧ��.����, 
                dbo.����.�����
FROM      dbo.ѧ�� INNER JOIN
                dbo.���� ON dbo.ѧ��.����� = dbo.����.�����