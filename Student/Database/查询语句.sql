use Student
/*�����������Ĵ�������5������������*/
select top(5) ����� ,count(*) as ���Ĵ���
from �������� 
where �Ƿ�����=1 
group by �����
order by ���Ĵ��� desc

/*����ƽ���ܷ���ߵļ�������*/
select top(5) ����� ,sum(�ܷ�)/count(*) as ƽ���ܷ�
from �������� 
group by �����
order by ƽ���ܷ� desc

insert into ѧ�� values ('202161001','����','��','1998-1-1','��','2016-9-1','12345678910','2021','N01B001','2')