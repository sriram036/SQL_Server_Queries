select * from customer inner join orderTable on customer.customerId = orderTable.customerId

select * from products

alter table orderTable add productId int references products(productId)

update orderTable set productId = 100 where orderId = 100

create trigger orderTrigger
on orderTable
after insert
as
begin
	set nocount on
	update p set p.productQuantity = p.productQuantity - o.quantity from products p join orderTable o on p.productId = o.productId
end

disable trigger orderTrigger on orderTable

enable trigger orderTrigger on orderTable

insert into orderTable (productName, quantity, rating, customerId, orderDate, productId) values ('Asus - Laptop', 2, 4, 7, GETDATE(), 111)

create table productAudit(
	changeId int primary key identity,
	productId int,
	productName varchar(25),
	productQuantity int,
	updatedAt datetime,
	operation varchar(25) check (operation = 'Inserted' or operation = 'Updated')
)

drop table productAudit

create trigger auditInsertTrigger
on products
after insert
as
begin
	set nocount on
	insert into productAudit select i.productId,i.productName,i.productQuantity,getdate(),'Inserted' from inserted i
end

select * from productAudit

delete from products where productId = 112

insert into products values (113, 'Lenovo - Laptop', 5, 10)

update products set productQuantity = 12 where productId = 113

drop trigger auditInsertTrigger

disable trigger auditInsertTrigger on products

enable trigger auditInsertTrigger on products

truncate table productAudit

create trigger auditUpdateTrigger
on products
after update
as
begin
	set nocount on
	insert into productAudit select u.productId, u.productName, u.productQuantity, getDate(), 'Updated' from inserted u
end

drop trigger auditUpdateTrigger

select * from orderTable

select * from customer

insert into orderTable (productName, quantity, rating, customerId, orderDate, productId) values ('Lenovo - Laptop', 1, 4, 5, GETDATE(), 113)

delete from orderTable where productId = 112

update products set productQuantity = 10 where productId = 111
