use EMS

create table tempTable(
	id int primary key identity,
	name varchar(50),
	email varchar(75),
	city varchar(50)
);

declare @counter int = 1
while(@counter <= 10000)
begin
	declare @name varchar(50) = 'ABC' + ltrim(@counter)
	declare @email varchar(75) = 'abc' + ltrim(@counter) + '@gmail.com'
	declare @city varchar(50) = 'city' + ltrim(@counter)

	insert into tempTable values (@name, @email, @city)

	set @counter = @counter + 1
end

select * from tempTable

select * from tempTable where id = 12943

alter index PK__tempTabl__3213E83F14C28343 on tempTable disable

drop index tempTable.PK__tempTabl__3213E83F14C28343

alter table tempTable drop constraint PK__tempTabl__3213E83F14C28343

create unique clustered index ixClusteredTempName
on tempTable(name)

select * from tempTable where id = 100

select * from tempTable where name = 'abc100'

update tempTable set name = 'ABC100' where id = 200 -- Cannot insert duplicate key row in object 'dbo.tempTable' with unique index 'ixClusteredTempName'. The duplicate key value is (ABC100).

drop index tempTable.ixClusteredTempName

select * from tempTable where city = 'city8583'

create index ixTempCity
on tempTable(city)

create index ixTempCityName
on tempTable(city,name)

select * from tempTable where name = 'abc9734' and city = 'city9734'

alter index ixTempCity on tempTable disable

alter index ixTempCity on tempTable rebuild

drop index tempTable.ixTempName

create unique index ixUniqueTempEmail
on tempTable(email)

delete from tempTable

truncate table tempTable

drop table tempTable