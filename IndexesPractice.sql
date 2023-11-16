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

select * from tempTable where id = 12943

select * from tempTable where city = 'city8583'

create index ixTempCity
on tempTable(city)

drop index tempTable.ixTempName

delete from tempTable

truncate table tempTable

drop table tempTable