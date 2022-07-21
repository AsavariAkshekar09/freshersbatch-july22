SELECT * FROM Customer
WHERE Country = 'Germany';

create table Employee
(
	ID INT NOT NULL PRIMARY KEY,
	Employee_FirstName NVARCHAR(50),
	Employee_LastName NVARCHAR(50),
	ManagerID nvarchar(20),
	DepartmentID nvarchar(20),
	Salary DECIMAL(12,2)
)

create table Manager
(
	MID nvarchar(20) NOT NULL PRIMARY KEY,
	Manager_Name nvarchar(50)
)

create table Department
(
	DID nvarchar(20) NOT NULL PRIMARY KEY,
	Department_Name nvarchar(50)
)

select * from Manager

ALTER table Employee add constraint Employee_ManagerID_FK
Foreign Key (ManagerID) references Manager (MID)

select * from Department

Alter table Employee add constraint Employee_DepartmentID_FK
Foreign Key (DepartmentID) references Department (DID)

select * from Employee

select Employee_FirstName+' '+Employee_LastName as [Employee Full Name] from Employee

select CONCAT(Employee_FirstName,' ',Employee_LastName) as [Full Name] from Employee

select * from Customer where FirstName LIKE '_H%'

select * from [Order]
select * from Product
select * from OrderItem
select * from Employee

select * from Product where UnitPrice > 10 AND UnitPrice < 20

select * from [Order] order by ShippingDate

select * from [Order] where ShippingName = 'La corne d''abondance' and 
ShippingDate BETWEEN '2022-07-15' AND '2022-07-20'

select * from Product where Supplied= 'Exotic Liquids'

select ProductID, AVG(Quantity) as AverageQuantity 
from OrderItem Group By ProductID 

Select OrderID,ProductID,IsDiscontinued from OrderItem
INNER JOIN Product
ON OrderItem.ProductID = Product.ID

select * from Employee

select		E.Employee_FirstName as [Employee Name], M.Employee_FirstName as [Manager Name]
from		Employee E
LEFT JOIN   Employee M
ON			E.ManagerID = M.ID


Select ProductName,Category,Price,OrderID from	Product
INNER JOIN [Order]
ON [Order].ID = Product.ID


select ProductName,OrderID,ProductID from OrderItem
INNER JOIN Product
ON OrderItem.ProductID = Product.ID


select (Employee_FirstName+' '+Employee_LastName) as EmployeeName , DepartmentName, Rating from Employee 


select		E.Employee_FirstName+' '+E.Employee_LastName as [Employee Name], M.Manager_Name as [Manager Name]
from		Employee E
INNER JOIN	Manager M
ON			E.ManagerID = M.MID


select E.Employee_FirstName+' '+E.Employee_LastName as [Employee Name] , D.Department_Name, E.Rating
from   Employee E
INNER JOIN   Department D
ON     E.DepartmentID = D.DID

select * from Employee
select * from Manager
select * from Department

 
select * from Customer --name,phone_no
select * from [Order] --CustomerID 
select * from Product
select * from OrderItem --orderid


--Print the bill for a given order id. Bill should contain Productname, Categoryname, price after discount.


create table ProductFinal
(
	PID int NOT NULL PRIMARY KEY,
	ProductName nvarchar(50),
	UnitPrice decimal(12,2),
	Discount decimal(12,2),
	Price_After_Discount AS ((100 - Discount)/100) * UnitPrice
)

select * from ProductFinal

SELECT OI.OrderID  , P.ProductName, P.Category, P.UnitPrice,P.Price_After_Discount
from ProductFinal P 
INNER JOIN OrderItem OI
ON P.PID = OI.ProductID
WHERE OI.OrderID = 102 

--Print the Total price of orders which have the products supplied by 'Exotic Liquids' 
--if the price is > 50 and also print it by Shipping company's Name

select O.TotalAmount,  O.ShippingName, P.Supplied
from [Order] O
FULL JOIN Product P
ON P.ID = O.CustomerID
WHERE P.Supplied = 'ExoticLiquids'

--Print all the Shipping company name and the ship names if they are operational

select ShippingName from [Order] WHERE Operational = 1


 
select * from Customer --name,phone_no
select * from [Order] --CustomerID 
select * from OrderItem --orderid
select * from Product


select  O.ID as [Number of Orders],P.ProductName, C.FirstName+' '+C.LastName as Customer, C.Phone, OI.ProductID
from	[Order] O
JOIN	Customer C
ON		C.ID = O.CustomerID
JOIN	OrderItem OI
ON		O.ID = OI.OrderID
JOIN	Product P
ON		P.ID = OI.ProductID
where	C.Phone = '7738906022'


select	O.ID as Orders, OI.ProductID, P.ProductName, C.FirstName+' '+C.LastName as Customer, C.Country
FROM	[Order] O
JOIN    Customer C
ON		C.ID = O.CustomerID
JOIN	OrderItem OI
ON		O.ID = OI.OrderID
JOIN    Product P
ON		P.ID = OI.ProductID
WHERE	C.Country != 'London'


select	O.ID as Orders, OI.ProductID, P.ProductName, C.FirstName+' '+C.LastName as Customer
from [Order] O
JOIN Customer C
ON	 C.ID = O.CustomerID
JOIN OrderItem OI
ON	 O.ID = OI.OrderID
JOIN Product P
ON   P.ID = OI.ProductID
where P.ProductName = 'Milk'





