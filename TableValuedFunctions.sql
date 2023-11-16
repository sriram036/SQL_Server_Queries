use EMS

-- Table Variables

declare @pr_tb table (
	prId int,
	prName varchar(25),
	prPrice int
);

insert into @pr_tb values (1,'Acer - Laptop', 30000), (2,'HP - Laptop', 35000), (3, 'OnePlus - SmartPhone', 23000)

select * from @pr_tb

select * from products

-- Inline Table Valued Functions

create function udfGetProducts(
	@quantity int
)
returns table
as
return
	select * from products where productQuantity < @quantity

select * from udfGetProducts(10)

select productName, productQuantity from udfGetProducts(5)

select * from customer

-- Multiple Statement Table Valued Functions

create function udfStoreCustomer(
	@city varchar(25)
)
returns @customerBasedCity table (
	customerName varchar(50),
	phone bigint,
	customerAddress varchar(100),
	country varchar(50),
	pincode int,
	city varchar(25)
)
as
begin
	insert into @customerBasedCity
	select customerName, phone, customerAddress, country, pincode, city from customer where city = @city;
	return;
end;

select * from udfStoreCustomer('bangalore')

update udfStoreCustomer('bangalore') set customerName = 'Ravi' where customerName = 'sriram' -- Object 'udfStoreCustomer' cannot be modified.

select * from @customerBasedCity -- Must declare the table variable "@customerBasedCity".

insert into customer (customerName, phone, customerAddress, country, pincode, city) values ('Karthika', 9372947391,'MG Road', 'India', 560020, 'Bangalore')

select * from employees

select * from employees where employeeName in (select customerName from udfStoreCustomer('bangalore'))

-- Inline Table Valued Functions

create function udfGetEmployeesByGender(
	@gender char
)
returns table
as
return select employeeName, employeeGender, employeeHiredDate, employeeNumber from employees where employeeGender = @gender

select * from udfGetEmployeesByGender('f')

select * from customer where customerName in (select employeeName from udfGetEmployeesByGender('m'))

select * from udfGetEmployeesByGender('m')

update udfGetEmployeesByGender('m') set employeeName = 'Ravi' where employeeName = 'sriram'

update udfGetEmployeesByGender('m') set employeeDesignation = 'devops' where employeeName = 'ravi' -- Invalid column name 'employeeDesignation'.
