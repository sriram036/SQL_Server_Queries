use EMS

create table customers (
	customerId int primary key identity(1,1),
	customerName varchar(25) not null,
	customerNumber bigint not null unique,
	customerEmail varchar(35) not null unique,
	customerCity varchar(25)
);

select * from customers

insert into customers(customerName, customerNumber, customerEmail, customerCity) values ('Rahul', 7392739383, 'ra@gmail.com', 'Bangalore'),
('Sharma', 9837498393, 'sh@gmail.com', 'Hyderabad'), ('Preethi', 8493930284, 'pr@gmail.com', 'Chennai'),
('Radhika', 8799302184, 'ra1@gmail.com', 'Hyderabad'), ('Sarathy', 7493821037, 'sa@gmail.com', 'Bangalore'),
('Rahul', 9374859392, 'ra2@gmail.com', 'Bangalore'), ('Mani', 9473927485, 'ma@gmail.com', 'Chennai'),
('Manimegalai', 8473928374, 'ma1@gmail.com', 'Chennai'), ('Swathy', 7392749564, 'sw@gmail.com', 'Hyderabad')

select customerName, customerNumber from customers

select customerName, customerNumber, customerCity from customers

select * from customers where customerCity = 'bangalore'

select * from customers where customerCity = 'bangalore' order by customerName

insert into customers (customerName, customerNumber, customerEmail, customerCity) values ('Rajesh', 8493748830, 'ra3@gmail.com', 'Varkala'),
('Bindhu', 7493739372, 'bi@gmail.com', 'Varkala'), ('Manik', 8393757575, 'ma2@gmail.com', 'Mumbai')

select customerCity, count(customerCity) as noOfCustomers from customers group by customerCity order by customerCity

select customerCity, count(customerCity) as noOfCustomers from customers group by customerCity having count(customerCity) >= 2 order by customerCity desc