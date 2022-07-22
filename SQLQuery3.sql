select O.TotalAmount as [Total Price of Orders], P.Supplied, O.ShippingName, P.UnitPrice
from [Order] O
Join OrderItem OI
ON O.ID = OI.OrderID
Join Product P
ON P.ID = OI.ProductID
WHERE P.UnitPrice > 50 AND P.Supplied = 'Exotic Liquids'

select * from Employee
select * from Manager
select * from Department
 
select * from Customer --name,phone_no
select * from [Order] --CustomerID 
select * from Product
select * from OrderItem --orderid

select ProductName as [Out of Stock Products] from Product where Quantity = 0

--Using subquery
SELECT ProductName as [Most Expensive Product], UnitPrice
FROM Product
WHERE UnitPrice = ( SELECT MAX(UnitPrice) from Product)
     
SELECT ProductName as [Least Expensive Product], UnitPrice
FROM Product
WHERE UnitPrice = ( SELECT MIN(UnitPrice) from Product)



--Display complete list of customers, the Order ID and date of any orders they have made

select * from Customer
select * from [Order] -- OrderDate,CustomerID,OrderDate
select * from OrderItem

select C.FirstName+' '+C.LastName as [List of Customers], O.ID as [Order ID], O.OrderDate
from Customer C
JOIN [Order] O
ON   C.ID = O.CustomerID

--query that determines the customer who has placed the maximum number of orders

select  O.CustomerID, C.FirstName+' '+C.LastName as Customer, O.ID as OrderID
from	Customer C
Join	[Order] O
ON		C.ID = O.CustomerID


select CustomerID, COUNT(CustomerID) as [Maximum Orders] 
FROM [Order] group by CustomerID


--Display the employee details whose joined at recently

select * from Employee order by [Joining Date] ASC

select * from Employee order by [Joining Date] DESC

--Display the list of products whose unit in stock is less than unit on order
select	P.ProductName, P.Quantity as [Unit in Stock], OI.Quantity [Unit in Orders]
from	Product P
join	OrderItem OI
on		P.ID = OI.ProductID
where	P.Quantity < OI.Quantity


select Supplied,Category from Product


Select LEFT(ShippingName,CHARINDEX(' ',ShippingName+' ')-1) AS CompanyName from [Order]

select C.FirstName, COUNT(CustomerID) as [Maximum Orders] 
FROM [Order] O
JOIN Customer C
on O.CustomerID = C.ID
group by C.FirstName


select * from Customer 
where SUBSTRING(FirstName,1,2) = 'AS'


select * from Customer
where FirstName LIKE '%AS%'



