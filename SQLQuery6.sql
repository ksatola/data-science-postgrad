USE Northwind

-- Szukamy informacji o produktach o cenach mniejszych 
-- niż 10 lub większych niż 20


-- Wybierz nazwy i ceny produktów o cenie jednostkowej 
-- pomiędzy 20.00 a 30.00

-- Wybierz nazwy i kraje wszystkich klientów mających siedziby 
-- w Japonii (Japan) lub we Włoszech (Italy)



-- Napisz instrukcję select tak aby wybrać numer zlecenia, 
-- datę zamówienia, numer klienta dla wszystkich niezrealizowanych
-- jeszcze zleceń, dla których krajem odbiorcy jest Argentyna
SELECT OrderID, OrderDate, CustomerID
FROM Orders
WHERE ShipCountry = 'Argentina' 
	AND (ShippedDate IS NULL OR ShippedDate > getdate())