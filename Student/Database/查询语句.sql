use Student
/*查找宿舍整改次数最大的5个宿舍的宿舍号*/
select top(5) 宿舍号 ,count(*) as 整改次数
from 宿舍卫生 
where 是否整改=1 
group by 宿舍号
order by 整改次数 desc

/*查找平均总分最高的几个宿舍*/
select top(5) 宿舍号 ,sum(总分)/count(*) as 平均总分
from 宿舍卫生 
group by 宿舍号
order by 平均总分 desc

insert into 学生 values ('202161001','张三','男','1998-1-1','汉','2016-9-1','12345678910','2021','N01B001','2')