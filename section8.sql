use EMS

select * from customers

select customerId, customerName from customers union select customerId, customerCity from customers

select customerId, customerName from customers union select customerId, customerName, customerCity from customers

-- All queries combined using a UNION, INTERSECT or EXCEPT operator must have an equal number of expressions in their target lists

select customerId, customerName from customers union select customerId, customerNumber from customers

-- Error converting data type varchar to bigint

select customerId, customerName from customers union select customerId, customerName from customer

select customerId, customerName from customers union all select customerId, customerName from customer

select * from customer

insert into customer (customerName, phone, customerAddress, country, salary, pincode) values
('Rahul', 948474837, 'MG Road - Bangalore', 'India', 30000, 560011), ('ajay', 836382736, 'Coastal Area', 'SriLanka', 25000, 703445),
('Vignesh', 839377839, 'HSR Layout - Bangalore', 'India', 25000, 562384)

select customerName from customers intersect select customerName from customer

select customerName from customers except select customerName from customer

select customerName from customers except select customerName from customer

alter table customer add city varchar(25) not null default 'Bangalore'

alter table customer drop column city

alter table customer drop constraint DF__customer__city__2739D489

update customer set city = 'Vizag' where customerId = 7

select city from customer except select customerCity from customers