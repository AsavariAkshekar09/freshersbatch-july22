create Database Shop

select * from Customer
select * from [Order]
select * from OrderItem
select * from Product

create Table [Order]
(
	ID int NOT NULL Primary Key,
	OrderDate datetime NOT NULL,
	OrderNumbar nvarchar(10),
	CustomerID int,
	TotalAmount decimal(12,2)
)

Alter table [Order] add constraint Order_CustomerID_FK
Foreign Key (CustomerID) references Customer (ID)

create Table OrderItem
(
	ID int NOT NULL Primary Key,
	OrderId int,
	ProductId int,
	UnitPrice decimal(12,2),
	Quantity int
)

Alter table OrderItem add constraint OrderItem_OrderID_FK
Foreign Key ([OrderID]) references [Order] (ID) 

Alter table OrderItem add constraint OrderItem_ProductID_FK
Foreign Key (ProductID) references Product (ID)

Insert into OrderItem values(1,101,21,700,3)
Insert into OrderItem values(2,102,22,500,7)
Insert into OrderItem values(3,103,23,610,8)

create Table Product
(
	ID int NOT NULL Primary Key,
	ProductName nvarchar(50),
	UnitPrice decimal(12,2),
	Package nvarchar(30),
	IsDiscontinued bit
)

Insert into Product values(21,'Bread',25,'primary',0)
Insert into Product values(22,'Milk',25,'primary',1)
Insert into Product values(23,'Ghee',50,'plastic',0)

SELECT * FROM Customer
WHERE Country LIKE 'A%' OR Country LIKE 'I%';

SELECT * FROM Customer
WHERE Country LIKE '[AI]%';

SELECT * FROM Customer
WHERE FirstName LIKE '__i%';


