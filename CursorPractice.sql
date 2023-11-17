use ems

select * from employees

-- Printing rows from employees table

declare 
	@id int,
	@name varchar(25),
	@number bigint,
	@mail varchar(50),
	@salary int,
	@designation varchar(25),
	@city varchar(25)
declare cursorEmployees cursor
for 
select employeeId, employeeName, employeeNumber, employeeEmail, employeeSalary, employeeDesignation, employeeCity
from employees where employeeId <= 110

open cursorEmployees

fetch next from cursorEmployees into 
	@id,
	@name,
	@number,
	@mail,
	@salary,
	@designation,
	@city

print 'id' + ' ' + 'Name' + ' ' + 'Number'
while @@fetch_status = 0
	begin
		print cast(@id as varchar) + ' ' + @name + ' ' + cast(@number as varchar)
		fetch next from cursorEmployees into 
			@id,
			@name,
			@number,
			@mail,
			@salary,
			@designation,
			@city
	end

close cursorEmployees

deallocate cursorEmployees

-- Updating employees Table using Cursor

declare
	@name varchar(50)

declare updateEmployeeCursor cursor
for
select employeeName from employees

open updateEmployeeCursor

fetch next from updateEmployeeCursor into
	@name

while @@fetch_status = 0 
	begin
		update employees set employeeName = substring(employeeEmail, 0, charindex('@', employeeEmail))
		fetch next from updateEmployeeCursor into
			@name
	end

close updateEMployeeCursor

deallocate updateEmployeeCursor

alter table Employees alter column employeeName varchar(75)

drop view vEmployees

select * from employees

select employeeName, substring(employeeName, charindex(' ', employeeName)+1, len(employeeName)-charindex(' ', employeeName)) as 'name' from employees

select employeeEmail, substring(employeeEmail, 0, charindex('@', employeeEmail)) as 'name' from employees

select * from managers