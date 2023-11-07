use EMS
-- Select Distinct
select * from customers

select distinct customerCity from customers

update customers set customerCity = 'Bangalore' where customerCity = 'Banhalore'

select customerName, customerCity from customers order by customerCity

select distinct customerName, customerCity from customers order by customerCity

select customerName,customerCity from customers group by customerCity, customerName

-- Select Using Where

select * from customers where customerCity = 'Telangana'

select * from customers where customerName = 'Rahul'

-- Select Using AND

select * from customers where customerCity = 'Telangana' and customerId = 37

select * from customers where customerName = 'Rahul' and  customerId = 24

-- Select Using OR

select * from customers where customerName = 'Rahul' or customerCity = 'Varkala'

select * from customers where customerName = 'Ram' or customerCity = 'Mumbai'

-- Select with IN

select * from customers where customerCity in ('Mumbai', 'Telangana', 'Varkala') order by len(customerEmail) desc

select * from customers where customerName in ('Rahul', 'nams', 'Bindhu') order by customerName

-- Select with Between

select * from customers where customerId between 30 and 40

select * from customers where customerNumber between 7482927393 and 8637292729

-- Select with like

select * from customers where customerEmail like '%ra%'

select * from customers where customerNumber like '%333%'

-- Select with Alias

select customerName as Name, customerCity, customerNumber from customers where customerCity = 'Mumbai'

select customerName 'Name', customerEmail from customers where customerCity = 'Telangana'

select customerName + ' - ' + customerCity as Name_And_City from customers where customerCity = 'Chennai'

select customerName + ' - ' + customerEmail + ' - ' + customerCity 'Name And Email And City' from customers where customerCity = 'Varkala'