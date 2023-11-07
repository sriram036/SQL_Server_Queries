use EMS

select * from customers

select top 10 * from customers

select * from customers order by customerCity

select top 10 * from customers order by customerCity

select top 1 percent * from customers order by len(customerEmail) desc

select top 10 * from customers order by customerCity

select top 10 with ties * from customers order by customerCity