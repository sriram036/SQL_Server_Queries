use EMS

select * from employees

select * from managers

select * from employees where managerId = (select managerId from managers where managerSalary >= 70000)

select * from employees where managerId in (select managerId from managers where managerSalary >= 60000)

select * from employees where managerId in (select managerId from managers where managerSalary between 60000 and 65000)

select employeeName, employeeCity from employees where employeeCity in (
	select customerCity from customers where customerCity in (
		select city from customer where city = 'Chennai' or city = 'Bangalore')
)

select * from customers

select * from customer

insert into customer (customerName, phone, customerAddress, country, salary, pincode, city) values ('Lakshmi', 836384010, 'AnnaNagar', 'India', 50000, 600028, 'Chennai')

update employees set employeeCity = 'Bangalore' where employeeId in (105,110)

select * from customers c where c.customerCity in (select city from customer where c.customerCity = city)

select * from customer c where c.city in (select d.customerCity from customers d where c.city = d.customerCity)

select * from employees

select * from employees where employeeSalary in (select salary from customer where customer.salary = employees.employeeSalary )

select employeeName, employeeCity, employeeSalary from employees where exists 
(select count(employeeSalary) from employees where employeeSalary > 25000 group by employeeSalary)

select employeeName, employeeCity from employees where employeeId = any (select employeeName from employees where employeeSalary > 25000)

-- Conversion failed when converting the varchar value 'Sriram' to data type int.

select employeeName, employeeCity from employees where employeeSalary < all (select managerSalary from managers)

select employeeName, employeeCity from employees where employeeSalary < all (select avg(employeeSalary) from employees)

select employeeName, employeeCity from employees where employeeSalary > all (select avg(employeeSalary) from employees)