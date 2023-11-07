use EMS

select * from customers order by customerName

select * from customers order by customerCity desc

select * from customers order by customerName, customerNumber

select * from customers order by customerName desc, customerCity asc

select customerName, customerCity from customers order by customerId

select customerName, customerEmail, customerCity from customers order by len(customerName) desc

select customerName, customerId, customerCity from customers order by 1 desc, 2 asc

select customerName, customerId, customerCity from customers order by  len(customerEmail) asc, len(customerCity) desc , 1 asc