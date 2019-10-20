USE Northwind

-- Szukamy informacji o produktach o cenach mniejszych 
-- niż 10 lub większych niż 20, posortuj malejaco po cenach
SELECT ProductName, UnitPrice
FROM Products
WHERE UnitPrice < 10 OR UnitPrice > 20
ORDER BY UnitPrice DESC

-- Wybierz nazwy i ceny produktów o cenie jednostkowej 
-- pomiędzy 20.00 a 30.00, posortuj rosnaco po cenach
SELECT ProductName, UnitPrice
FROM Products
WHERE UnitPrice BETWEEN 20 AND 30
ORDER BY UnitPrice ASC

-- Wybierz nazwy i kraje wszystkich klientów mających siedziby 
-- w Japonii (Japan) lub we Włoszech (Italy)
SELECT CompanyName, Country
FROM Customers
WHERE Country IN ('Japan', 'Italy')

-- Napisz instrukcję select tak aby wybrać numer zlecenia, 
-- datę zamówienia, numer klienta dla wszystkich niezrealizowanych
-- jeszcze zleceń, dla których krajem odbiorcy jest Argentyna
SELECT OrderID, OrderDate, CustomerID
FROM Orders
WHERE ShipCountry = 'Argentina' 
	AND (ShippedDate IS NULL OR ShippedDate > getdate())