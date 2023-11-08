use EMS

select * from customer

select customerCity, count(customerCity) 'No Of Customers' from customers group by customerCity

select * from orderTable

select customerId, orderDate, count(customerId) 'No of Orders' from orderTable group by customerId, orderDate

select customerId, orderDate, count(customerId) 'No of Orders' from orderTable where customerId in (1,2) group by customerId, orderDate

select customerId, orderDate, count(customerId) 'No of Orders' from orderTable where customerId in (1,2) group by customerId, orderDate order by customerId

select customerId, orderDate, count(customerId) 'No of Orders' from orderTable where customerId in (1,2) group by customerId, orderDate having count(customerId) > 1 order by customerId

alter table orderTable add orderDate date not null default '10-21-2020'

alter table orderTable drop column orderDate

alter table orderTable drop constraint DF__orderTabl__order__151B244E

insert into orderTable (productName, quantity, rating, customerId, orderDate) values ('OnePlus - SmartPhone', 1, 4, 1, '2021'),
('Sony - SmartPhone', 1, 5, 2, '2020'), ('Lenovo - Laptop', 1, 4, 3, '2021')

select * from customers

select customerCity, count(customerName) from customers group by customerCity

select customerCity, count(customerName) 'No of Customers' from customers group by grouping sets ((customerCity))

select customerCity, count(customerName) 'No of Customers' from customers group by grouping sets ((customerCity, customerName))

select grouping(customerCity), customerCity, count(customerName) 'No of Customers' from customers group by grouping sets ((customerCity))

select grouping(customerCity), customerCity, count(customerName) 'No of Customers' from customers group by grouping sets ((customerCity), (customerName, customerCity))

select customerCity from customers group by cube (customerCity)

select customerCity, customerName from customers group by cube (customerCity,customerName)

select count(customerCity), customerCity, customerName from customers group by cube (customerCity,customerName)

select count(customerCity), customerCity, customerName from customers where customerId in (30, 40) group by cube (customerCity,customerName, customerEmail)

select customerName, customerCity from customers group by customerCity, rollup (customerCity, customerName)