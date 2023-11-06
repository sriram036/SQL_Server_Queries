use EMS

create table employees(
	employeeId int not null primary key identity(50,5),
	employeeName varchar(25),
	employeeAge tinyint,
	employeeGender char,
	employeeSalary int,
	employeeCity varchar(25)
);

select * from employees

update employees set employeeAge = 19 where employeeAge = 15

update employees set employeeSalary = 30000 where employeeId = 50

insert into employees (employeeName, employeeAge, employeeGender, employeeSalary, employeeCity) values ('Sriram', 15, 'M', 15000, 'chennai'),
('Preethi', 20, 'F', 25000, 'tuticorin'),('Karthick', 25, 'K', 200000, 'Kovilpatti')

alter table employees add check (employeeAge > 18)

insert into employees (employeeAge, employeeSalary, employeeName, employeeCity, employeeGender) values (21, 25000, 'ShanmugamSundari', 'Kanchipuram', 'G')

alter table employees add check (employeeGender = 'M' or employeeGender = 'F')

insert into employees (employeeAge, employeeCity, employeeGender, employeeName, employeeSalary) values (19, 'Sivakasi', 'F', 'AppaSwamy', 300000)

alter table employees add check (employeeSalary >= 20000 and employeeSalary < 35000)

insert into employees (employeeAge, employeeCity, employeeGender, employeeName, employeeSalary) values (19, 'Sivakasi', 'm', 'karuppaSwamy', 30000)

alter table employees add employeeDesignation varchar(5) not null default 'dev'

alter table employees drop column employeeDesignation

alter table employees alter column employeeDesignation varchar(25)

update employees set employeeDesignation = 'BackendDeveloper' where employeeId = 50

insert into employees (employeeAge, employeeCity, employeeGender, employeeName, employeeSalary) values (23, 'Sattur', 'F', 'Kavya', 32000)

alter table employees add employeeType bit not null default 1

update employees set employeeType = 0 where employeeSalary < 21000

alter table employees add employeeHiredDate date not null default '12-31-2015'

alter table employees drop constraint DF__employees__emplo__6E01572D

alter table employees drop column employeeHiredDate

update employees set employeeHiredDate = '03-25-2023' where employeeType = 0

create table employeeAttendance (
	entryTime datetime,
	exitTime dateTime,
	employeeId int foreign key references employees(employeeId)
);

insert into employeeAttendance values ('2023-06-07 09:30:00', '2023-06-11 18:00:00', 60),
('2023-06-07 09:55:00', '2023-06-11 17:40:00' , 90),
('2023-06-07 09:20:00', '2023-06-11 17:30:00', 105), ('2023-06-07 09:55:00', '2023-06-11 17:00:00' , 50)

select * from employeeAttendance

update employeeAttendance set exitTime = '2023-06-07 17:00:00' where exitTime like '%11%'

select e.employeeId, e.employeeName, e.employeeNumber, e.employeeDesignation, e.employeeType, e.employeeEmail, ea.entryTime from 
employees as e inner join employeeAttendance as ea on e.employeeId = ea.employeeId and ea.entryTime > '2023-06-07 09:30' and ea.exitTime <= '2023-06-07 20:00'

alter table employees add employeeNumber bigint not null default 0000000000

alter table employees drop constraint DF__employees__emplo__72C60C4A

alter table employees drop column employeeNumber

alter table employees add employeeEmail varchar(25) not null default 'default@email.com'

update employees set employeeNumber = 7834603761 where employeeId = 90

alter table employees add unique (employeeNumber)

alter table employees add unique (employeeEmail)

update employees set employeeEmail = 'shs@gmail.com' where employeeId = 55

select * from employees

insert into employees
(employeeAge, employeeCity, employeeGender, employeeName, employeeSalary, employeeEmail, employeeNumber)
values (25, 'chennai', 'M', 'Ajay', 25000, 'aja@gmail.com', 7493828889)

select employeeName from employees where exists (select entryTime from employeeAttendance where employees.employeeId = employeeAttendance.employeeId)

update employeeAttendance set employeeId = 55 where employeeId = 90

insert into employeeAttendance (entryTime, exitTime) values ('2023-06-07 09:20', '2023-06-07 19:00')