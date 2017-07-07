use dbname;
go

set transaction isolation level read uncommitted;

select column1, column2, column3
from dbo.table1 t1
	inner join dbo.table2 t2 on t1.columna = t2.columna
where t1.columnb = 5;