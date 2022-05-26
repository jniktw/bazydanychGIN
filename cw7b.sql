-- 1
Create function fibb (@val int)
Returns int
As
Begin
	DECLARE @i1 int, @i2 int, @i3 int, @i int;
	Set @i1 = 0;
	Set @i2 = 1;
	Set @i = 2;
	If (@val = 0) 
		Set @i3 = 0;
	Else If (@val = 1) 
		Set @i3 = 1;
	Else 
		Begin 
			Set @i3 = @i2 + @i1;
			while (@i < @val)
			Begin
				Set @i1 = @i2;
				Set @i2 = @i3;
				Set @i3 = @i2 + @i1;
				Set @i = @i + 1
			End
		End
Return @i3
End;

Create Procedure fibonacci(
@val int
)
AS
Begin
	Declare @i int, @k int;
	Set @i = 0;
	while @i <= @val
		Begin 
		print Concat('Liczba: ',@i,' -> Wartosc: ',dbo.fibb(@i));
		Set @i = @i + 1
		End
End

Drop function fibb
Drop Procedure fibonacci

Exec dbo.fibonacci @val = 25
-- 2


Create Trigger 
	abc on Person.Person
After Insert
AS
UPDATE Person.Person Set FirstName = Upper(FirstName)
where ModifiedDate = (Select max(ModifiedDate) from Person.Person)
UPDATE Person.Person Set LastName = Upper(LastName)  
where ModifiedDate = (Select max(ModifiedDate) from Person.Person)

Insert into Person.Person (BusinessEntityID, PersonType, FirstName, LastName) Values (888,'EM','Jakub', 'Niemiec')

Delete from Person.Person where LastName = 'Niemiec'



Select * from Person.Person

Drop Trigger Person.abc

-- 3

Create Trigger taxRateMonitoring on Sales.SalesTaxRate
Instead of Update
AS
Begin
Declare @old int, @new int;
Set @old = (Select TaxRate from deleted)
Set @new = (Select TaxRate from inserted)
If (@new < 0.7*@old OR @new > 1.3*@old)
	print 'Nowa wartoœæ nie spe³nia dopuszczalnych wymogów - zmiana wzglêdem starej wartoœci jest wiêksza ni¿ 30%';
Else 
	Update Sales.SalesTaxRate 
	Set TaxRate = @new
	Where  SalesTaxRateID =  (Select SalesTaxRateID from inserted)
END

Drop Trigger Sales.taxRateMonitoring

Select * from Sales.SalesTaxRate

	Update Sales.SalesTaxRate 
	Set TaxRate = 15.00
	Where  SalesTaxRateID =  4

	