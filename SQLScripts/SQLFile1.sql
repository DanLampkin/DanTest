use dbname;
go

set transaction isolation level read uncommitted;

-- Keyword102
select column1, column2, column3
from dbo.table1 t1
	inner join dbo.table2 t2 on t1.columna = t2.columna
where t1.columnb = 5;

-- added a Keyword103 for testing
-- Now in branch1 Keyword1002