-- 1

Use AdventureWorks2019

With TempEmployeeInfo (BusinessEntityID, FirstName, LastName, BirthDate, Gender, JobTitle, HireDate, Rate)
As
(
Select Person.BusinessEntityID, FirstName, LastName, BirthDate, Gender, JobTitle, HireDate, Rate
from (Person.Person 
Inner Join HumanResources.Employee 
on Person.BusinessEntityID = Employee.BusinessEntityID) 
Inner join HumanResources.EmployeePayHistory 
on Employee.BusinessEntityID = EmployeePayHistory.BusinessEntityID
)


Select * from TempEmployeeInfo

--2

Use AdventureWorksLT2019

With ComContact (FirstName,LastName,CompanyName,TotalDue)
As
(
Select FirstName,LastName,CompanyName,TotalDue from  SalesLT.Customer 
Inner join SalesLT.SalesOrderHeader 
on Customer.CustomerID = SalesOrderHeader.CustomerID
)

Select CONCAT(CompanyName, ' (', FirstName, ' ', LastName, ')') as CompanyContact, TotalDue as Revenue
from ComContact
Order by CompanyContact

--3
With Cabc (Name,LineTotal)
As
(
Select ProductCategory.Name,LineTotal from  (SalesLT.ProductCategory
inner join SalesLT.Product 
on ProductCategory.ProductCategoryID = Product.ProductCategoryID)
inner join SalesLT.SalesOrderDetail 
on Product.ProductID = SalesOrderDetail.ProductID
)

Select Name as Category, round(sum(LineTotal),2) as SalesValue
from Cabc
Group by Name
Order by Category