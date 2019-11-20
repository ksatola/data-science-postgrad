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

