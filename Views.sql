use EMS

select * from customer

create view vCustomerWithOrder
with schemabinding
as
select c.customerName,c.city,o.productName,o.quantity,o.orderDate from dbo.customer c inner join dbo.orderTable o on c.customerId = o.customerId

with cteNoOfProducts(name, noOfProducts)
as
(
	select customerName,count(productName) as noOfProducts from vCustomerWithOrder group by customerName
)
select customerName, productName from vCustomerWithOrder v inner join cteNoOfProducts c on v.customerName = c.name where c.noOfProducts >= 2

select customerName,count(productName) as NoOfProducts from vCustomerWithOrder group by customerName order by NoOfProducts desc

select * from vCustomerWithOrder where customerName = 'sriram' and productName = 'HP - Laptop'

create unique clustered index ixUniqueProductCustomer -- To create index for view, the view should be created with the schemabinding
on dbo.vCustomerWithOrder(customerName, productName)  -- Index can't be created if view created with subquery

create nonclustered index ixCity
on vCustomerWithOrder(city)

select * from vCustomerWithOrder

select * from vCustomerWithOrder where city = 'mumbai'

alter index ixCity on vCustomerWithOrder disable

drop view vCustomerWithOrder

drop index ixUniqueProductCustomer on vCustomerWithOrder

select * from employees

create view vEmployees
with schemabinding
as 
select employeeId, employeeName, employeeSalary, employeeEmail, employeeNumber from dbo.employees where employeeId not in 
(select managerId from dbo.managers)

select * from vEmployees

drop view vEmployees