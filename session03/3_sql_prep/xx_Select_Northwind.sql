USE Northwind

-- Wybierz nazwy i adresy wszystkich klientow
SELECT CompanyName, Address, City, PostalCode, Country
FROM Customers

-- Wybierz nazwiska i numery telefonow pracownikow
SELECT LastName, HomePhone
FROM Employees

-- WHERE
SELECT LastName, City
FROM Employees
WHERE Country = 'USA'

-- Znajdz numer zamowienia oraz identyfikator klienta dla zamowien z data
-- wczesniejsza niz 8/1/96 z tabeli zamowien
SELECT OrderID, CustomerID
FROM Orders
WHERE OrderDate < '8/1/96'

-- Wybierz nazwy i adresy wszystkich klientow majacych siedziby we Francji lub Hiszpanii
SELECT Customers.CompanyName, Customers.Address--, Country
FROM Customers
WHERE Country LIKE 'France' OR Country LIKE 'Spain'
--WHERE Country IN ('France', 'Spain')

-- pomocnicza
SELECT * FROM Customers

-- Wybierz nazwy i ceny produktow o cenie jednostkowej pomiedzy 20.00 a 30.00
SELECT Products.ProductID, Products.UnitPrice
FROM Products
WHERE UnitPrice BETWEEN 20.00 AND 30.00

-- Wybierz nazwy produktow, ktorych nie ma w magazynie
SELECT Products.ProductName
FROM Products
WHERE UnitsInStock = 0

-- LIKE
-- %    0 lub wiecej znakow
-- -    pojedynczy znak
-- []   pojedynczy znak z zakresu
-- [^]  pojedynczy znak spoza zakresu

SELECT Customers.CompanyName
FROM Customers
WHERE CompanyName LIKE '%Restaurant%'

-- Szukamy informacji o producktach sprzedawanych w butelkach ('bottle')
SELECT ProductID, ProductName, QuantityPerUnit
FROM Products
WHERE QuantityPerUnit LIKE '%bottle%'

SELECT * FROM Products

-- Wyszukaj informacje o stanowisku pracownikow, ktorych nazwiska
-- zaczynaja sie na litere z zakresu od B do L
SELECT Title, LastName
FROM Employees
WHERE LastName LIKE '[B-L]%'

-- Wyszukaj informacje o stanowisku pracownikow, ktorych nazwiska
-- zaczynaja sie na litere z B lub L
SELECT Title, LastName
FROM Employees
WHERE LastName LIKE '[BL]%'

-- Znajdz nazwy kategorii, ktore w opisie zawieraja przecinek
SELECT CategoryName, Description
FROM Categories
WHERE Description LIKE '%,%'

-- Znajdz nazwy kategorii, ktore w opisie NIE zawieraja przecinka
SELECT CategoryName, Description
FROM Categories
WHERE Description LIKE '%[^,]%'

-- Znajdz klientow, ktorzy w swojej nazwie maja w ktoryms miejscu slowo 'Store'
SELECT CompanyName
FROM Customers
WHERE CompanyName LIKE '%Store'

