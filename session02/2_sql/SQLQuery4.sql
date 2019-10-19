-- 1996-08-01

-- Wybierz nazwy i adresy wszystkich klientów mających siedziby w Londynie
SELECT CompanyName, Address, City, Region, PostalCode, Country
FROM Customers
WHERE City = 'London'

-- Wybierz nazwy i adresy wszystkich klientów mających siedziby 
-- we Francji lub w Hiszpanii
SELECT CompanyName, Address, City, Region, PostalCode, Country
FROM Customers
WHERE Country = 'France' OR Country = 'Spain'

-- Wybierz nazwy i ceny produktów o cenie jednostkowej 
-- pomiędzy 20.00 a 30.00
SELECT ProductName, UnitPrice
FROM Products
WHERE UnitPrice >= 20 AND UnitPrice <= 30

-- Wybierz nazwy i ceny produktów z kategorii ‘meat’
DECLARE @id INT

SET @id = (
SELECT CategoryId 
FROM Categories
WHERE CategoryName = 'Meat/Poultry')

SELECT * FROM Products WHERE CategoryId = @id

--
SELECT *
FROM Products 
WHERE CategoryId = (
	SELECT CategoryId 
	FROM Categories
	WHERE CategoryName = 'Meat/Poultry')

-- Wybierz nazwy produktów oraz inf. o stanie magazynu 
-- dla produktów dostarczanych przez firmę ‘Tokyo Traders’
SELECT ProductName, UnitsInStock
FROM Products
WHERE SupplierId = (
	SELECT SupplierId 
	FROM Suppliers 
	WHERE Companyname = 'Tokyo Traders')

-- Wybierz nazwy produktów których nie ma w magazynie
SELECT ProductName
FROM Products
WHERE UnitsInStock = 0


