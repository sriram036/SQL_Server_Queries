select * from customer

select * from orderTable

select c.customerName, c.phone, o.productName, o.orderDate from customer as c inner join orderTable as o on c.customerId = o.customerId

select c.customerName, c.phone, o.productName, o.orderDate from customer as c left join orderTable as o on c.customerId = o.customerId

select o.productName, o.orderDate ,c.customerName, c.phone from orderTable as o right join customer as c on c.customerId = o.customerId

select * from employees

create table managers (
	managerId int primary key,
	managerName varchar(25),
	managerSalary int check (managerSalary >= 50000)
);

insert into managers values (55, 'Preethi', 70000), (110, 'Ajay', 65000), (105,'Kavya', 55000)

select * from managers

alter table employees add managerId int constraint manager_fk foreign key references managers(managerId)

update employees set managerId = 105 where employeeId = 100

select e.employeeName as ManagerName, e.employeeSalary, m.employeeName, m.employeeSalary from employees e, employees m where e.employeeId = m.managerId

select e.employeeName as ManagerName, e.employeeSalary, m.employeeName, m.employeeSalary from employees e left join employees m on e.employeeId = m.managerId

select e.employeeName as ManagerName, e.employeeSalary, m.employeeName, m.employeeSalary from employees e right join employees m on e.employeeId = m.managerId

insert into managers values (120, 'Pradeep', 40000)

-- The INSERT statement conflicted with the CHECK constraint "CK__managers__manage__4F47C5E3". The conflict occurred in database "EMS", table "dbo.managers", column 'managerSalary'.

insert into managers values (120, 'Pradeep', 50000)

select e.employeeName , m.managerName from employees e inner join managers m on e.managerId = m.managerId

select e.employeeName , m.managerName from employees e left join managers m on e.managerId = m.managerId

select e.employeeName , m.managerName from employees e right join managers m on e.managerId = m.managerId

select e.employeeName , m.managerName from employees e cross join managers m