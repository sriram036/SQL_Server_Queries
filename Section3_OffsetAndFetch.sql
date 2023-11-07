use EMS

select * from customers

select * from customers where customerCity like '%hy%'

select * from customers order by len(customerName) desc

select * from customers order by len(customerName) desc offset 5 rows

select * from customers order by len(customerName) fetch first 5 rows only -- Invalid usage of the option first in the FETCH statement.

select * from customers order by len(customerName) fetch next 5 rows only -- Invalid usage of the option next in the FETCH statement.

insert into customers (customerName, customerNumber, customerEmail, customerCity) values ('Kumar', 9464837333, 'ka@gmail.com', 'New York'),
('Vignesh', 8493228311, 'vi@gmail.com', 'Chennai'), ('Narmadha', 8333839929, 'na@gmail.com', 'Telangana'),
('nams', 7494994944, 'na1@gmail.com', 'Mumbai'), ('Vasu', 7383939329, 'va@gmail.com', 'Telangana'), ('Divya', 7393999933, 'di@gmail.com', 'Chennai'),
('Karthika', 8493838380, 'ka1@gmail.com', 'Banhalore'), ('ajay', 997393901, 'aj@gmail.com', 'Mumbai')

insert into customers (customerName, customerNumber, customerEmail, customerCity) values('Revathy', 9949499933, 're@gmai.com', 'Hyderabad')

select * from customers order by customerName

select * from customers order by customerName offset 10 rows

select * from customers order by customerName offset 10 rows fetch first 5 rows only

select * from customers order by customerName offset 10 rows fetch next 5 rows only

update customers set customerName = 'Swathi' where customerId = 43

