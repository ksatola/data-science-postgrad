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
WHERE Country LIKE 'USA'

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

-- Szukamy informacji o producktach o cenach mniejszych niz 10 lub wiekszych niz 20
SELECT ProductName, UnitPrice
FROM Products
--WHERE UnitPrice < 10 OR UnitPrice > 20
WHERE UnitPrice NOT BETWEEN 10 AND 20

-- Wybierz nazwy i ceny produktow o cenie jednostkowej pomiedzy 20.00 a 30.00
SELECT ProductName, UnitPrice
FROM Products
--WHERE UnitPrice >= 20 AND UnitPrice <= 30
WHERE UnitPrice BETWEEN 20 AND 30

-- Napisz instrukcje select tak, aby wybrac numer zlecenia,
-- date zamowienia, numer klienta dla wszystkich niezrealizowanych jeszcze zlecen,
-- dla ktorych krajem odbiorcy jest Argentyna
SELECT OrderID, OrderDate, CustomerID--, ShipCountry, ShippedDate
FROM Orders
WHERE ShipCountry LIKE '%Argentina%' AND ShippedDate IS NULL

-- Sortowanie danych - ORDER BY
SELECT ProductID, ProductName, CategoryID, UnitPrice
FROM Products
ORDER BY CategoryID ASC, UnitPrice DESC

-- lub z wykorzystaniem numerow zwracanych kolumn
SELECT ProductID, ProductName, CategoryID, UnitPrice
FROM Products
ORDER BY 3 ASC, 4 DESC

-- Wybierz nazwy i kraje wszystkich klientow, wyniki posortuj wg kraju,
-- w ramach danego kraju nazwy firm posortuj alfabetycznie
SELECT Country, CompanyName
FROM Customers
ORDER BY Country, CompanyName

-- Wybierz informacje o produktach (grupa, nazwa, cena),
-- produkty posortuj wg grup, a w grupach malejaco wg ceny
SELECT CategoryID, UnitPrice, ProductName
FROM Products
ORDER BY CategoryID, UnitPrice DESC

-- wersja z joinami
SELECT C.CategoryName, UnitPrice, ProductName
FROM Products P
INNER JOIN Categories C on P.CategoryID = C.CategoryID
ORDER BY CategoryName, UnitPrice DESC

-- Zapytanie jak powyzej, ale tylko dla dostawcow z Japonii i Wloch
SELECT C.CategoryName, UnitPrice, ProductName, S.CompanyName, S.Country
FROM Products P
INNER JOIN Categories C on P.CategoryID = C.CategoryID
INNER JOIN Suppliers S on P.SupplierID = S.SupplierID
WHERE S.Country IN ('Japan', 'Italy')
--WHERE S.Country LIKE '%Japan%' OR S.Country LIKE '%Italy%'
ORDER BY CategoryName, UnitPrice DESC

-- Eliminowanie duplikatow - DISTINCT
SELECT DISTINCT Country
FROM Suppliers
ORDER BY Country

-- Zmiana nazw kolumn
SELECT FirstName AS First, LastName AS Last, EmployeeID AS 'Empl. ID'
--SELECT FirstName AS First, LastName AS Last, EmployeeID AS [Empl. ID]
FROM Employees

-- bez AS
SELECT FirstName First, LastName Last, EmployeeID 'Empl. ID'
--SELECT FirstName AS First, LastName AS Last, EmployeeID AS [Empl. ID]
FROM Employees

-- Uzycie wartosci stalych
SELECT FirstName, LastName, 'Id number:' + CAST(EmployeeID AS varchar(5))
FROM Employees

-- Kolumny wyliczane
-- Podaj UnitPrice powiekszony o 5%
SELECT OrderID, UnitPrice, UnitPrice * 1.05 as NewUnitPrice
FROM [Order Details]

-- Operacje na napisach
SELECT FirstName + ' ' + LastName as [Imie i Nazwisko]
FROM Employees

-- Napisz polecenie, ktore oblicza wartosc kazdej pozycji zamowienia o numerze 10250
SELECT OrderID, UnitPrice, Quantity, Discount,
       (UnitPrice * Quantity - (UnitPrice * Quantity * Discount)) AS Final
FROM [Order Details]
WHERE OrderID = 10250

-- Napisz polecenie, ktore dla kazdego dostawcy (Supplier) pokaze pojedyncza kolumne
-- zawierajaca nr telefonu i nr faksu w formacie
-- (numer telefonu i faksu maja byc oddzielone przecinkiem)
SELECT CompanyName, Phone + ', ' + Fax AS 'Phone, Fax'
FROM Suppliers