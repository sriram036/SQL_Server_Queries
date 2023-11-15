select * from employeeAttendance

insert into employeeAttendance values (sysdatetime(), null,55)

select * from customer inner join orderTable on customer.customerId = orderTable.customerId;

select * from products

create function udfPr(
	@quantity int,
	@price int
)
returns int
as
begin
	return @quantity * @price;
end

select dbo.udfPr(2,20) price

select c.customerId, c.customerName, o.orderId,o.productName,o.quantity,dbo.udfPr(quantity,20) price from orderTable o inner join customer c on c.customerId = o.customerId

select c.customerName,sum(dbo.udfPr(quantity, 20000)) TotalPrice from customer c inner join orderTable o on c.customerId = o.customerId group by c.customerName