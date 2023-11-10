use EMS

select * from customer

select * from orderTable

select count(customerId) from orderTable group by customerId

select c.customerName from customer c inner join orderTable o on c.customerId = o.customerId group by c.customerName

select c.customerName, count(o.customerId) from customer c inner join orderTable o on c.customerId = o.customerId group by c.customerName

select * from customer where customerId in (
select c.customerId from customer c inner join orderTable o on c.customerId = o.customerId group by c.customerId)

with cte_customer (id, noOfProducts) as (
	select c.customerId, count(o.productName) from customer c inner join orderTable o on c.customerId = o.customerId group by c.customerId
)
select c.customerName, c.phone, c.city, ct.noOfProducts from customer c inner join cte_customer ct on 
c.customerId = ct.id order by ct.noOfProducts desc

with cte_customer (id, noOfProducts) as (
	select c.customerId, count(o.productName) from customer c inner join orderTable o on c.customerId = o.customerId group by c.customerId
)
select c.customerName, c.phone, c.city, ct.noOfProducts from customer c inner join cte_customer ct on 
c.customerId = ct.id where noOfProducts >= 2

with cte_customer (id, noOfProducts) as (
	select c.customerId, count(o.productName) from customer c inner join orderTable o on c.customerId = o.customerId group by c.customerId
)
select c.customerName, c.phone, c.city, ct.noOfProducts from customer c left join cte_customer ct on c.customerId = ct.id

with cte_customer (id, noOfProducts) as (
	select c.customerId, count(o.productName) from customer c inner join orderTable o on c.customerId = o.customerId group by c.customerId
),
cte_customer1 (id, noOfProducts) as (
	select id,noOfProducts from cte_customer where noOfProducts = (select max(noOfProducts) from cte_customer)
)
select c.customerName, c.phone, c.city, ct1.noOfProducts from customer c inner join cte_customer1 ct1 on 
c.customerId = ct1.id

-- Recursive CTE

with cte_employees (id, name, mid, salary) as (
	select employeeId, employeeName, managerId, employeeSalary from employees where managerId is null union all 
	select e.employeeId, e.employeeName, m.managerId, m.managerSalary from employees e inner join managers m on e.employeeId = m.managerId
)
select * from cte_employees
