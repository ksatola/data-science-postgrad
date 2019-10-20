USE Northwind

-- Szukamy informacji o produktach sprzedawanych w butelkach (‘bottle’)
SELECT *
FROM Products
WHERE QuantityPerUnit LIKE '%bottles%'

-- Wyszukaj informacje o stanowisku pracowników, 
-- których nazwiska zaczynają się na literę z zakresu od B do L
SELECT Title
FROM Employees
WHERE LastName LIKE '[B-L]%'

SELECT Title
FROM Employees
WHERE LastName >= 'B%' AND LastName < 'M%'

-- Wyszukaj informacje o stanowisku pracowników, 
-- których nazwiska zaczynają się na literę B lub L
SELECT Title, LastName
FROM Employees
WHERE LastName LIKE 'B%' OR LastName LIKE 'L%'

-- Znajdź nazwy kategorii, które w opisie zawierają przecinek
SELECT CategoryName, Description
FROM Categories
WHERE Description LIKE '%[,]%'

-- Znajdź klientów, którzy w swojej nazwie mają 
-- w którymś miejscu słowo ‘Store’
SELECT CompanyName
FROM Customers
WHERE CompanyName LIKE '%Store%'

