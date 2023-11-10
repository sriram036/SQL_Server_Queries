use EMS

select * from employees

create proc spGetEmployee
as
begin
	select * from employees
end

exec spGetEmployee

create proc spGetEmployeeBasedOnSalary
@salary int
as
begin
	select * from employees where employeeSalary > @salary
end

exec spGetEmployeeBasedOnSalary 25000

alter proc spGetEmployeeBasedOnSalary
@salary int,
@gender char
as
begin
	select * from employees where employeeSalary >= @salary and employeeGender = @gender
end

exec spGetEmployeeBasedOnSalary 25000, f

drop proc spGetEmployeeBasedOnSalary

create proc spGetEmployeeCountGreaterThanCertainAge
@age int,
@noOfEmployees int out
as
begin
	select @noOfEmployees = count(employees.employeeId) from employees where employeeAge >= @age
end

declare @employeeCount int

exec spGetEmployeeCountGreaterThanCertainAge 21, @employeeCount out

print @employeeCount

create proc spInsertEmployeeData
@name varchar(25),
@type bit,
@joinedDate datetime,
@email varchar(25),
@number bigint
as
begin
	insert into employees (employeeName, employeeType, employeeHiredDate, employeeEmail, employeeNumber)
	values (@name, @type, @joinedDate, @email, @number)
end

exec spInsertEmployeeData sivaji,1,'2020-08-17','si@gmail.com',938300010

select * from employees

alter proc spInsertEmployeeData
@name varchar(25),
@type bit,
@joinedDate datetime,
@email varchar(25),
@number bigint
as
begin
	insert into employees (employeeName, employeeType, employeeHiredDate, employeeEmail, employeeNumber)
	values (@name, @type, @joinedDate, @email, @number);
	select * from employees where employeeName = @name and employeeHiredDate = @joinedDate
end

exec spInsertEmployeeData prabu,0,'2018-02-27','pr@gmail.com',977380010

create proc spUpdateEmployeeData
@id int,
@age tinyint,
@gender char,
@salary int,
@city varchar(25),
@designation varchar(25),
@managerid int
as
begin
	select * from employees where employeeId = @id;
	update employees set employeeAge = @age, employeeGender = @gender, employeeSalary = @salary,
	employeeCity = @city, employeeDesignation = @designation, managerId = @managerid where employeeId = @id;
	select * from employees where employeeId = @id;
end

exec spUpdateEmployeeData 120, 19, M, 22000, brindavan, frontendDeveloper, 105

create proc spGetEmployeeAndCustomerUsingSp
as
begin
	exec spGetEmployee;
	select * from customer
end

exec spGetEmployeeAndCustomerUsingSp