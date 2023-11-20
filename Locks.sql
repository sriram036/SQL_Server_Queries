use EMS

-- Exclusive Lock
-- Can use for insert, update, delete statement

begin tran
	update employees1 set name = 'madan' where id = 2
rollback
commit tran

-- Use Another tab to check

select * from employees1


-- Shared Lock
-- Can use for select statement

set transaction isolation level repeatable read
begin tran
	select * from employees1
rollback
commit tran

-- Use Another tab to check

update employees1 set name = 'Sumathi', city = 'Ernakulam' where id = 5

select * from employees1
