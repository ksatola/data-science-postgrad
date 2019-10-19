-- Wybierz nazwy i adresy wszystkich klientów
SELECT ContactName, Address, City, PostalCode FROM Customers

-- Wybierz nazwiska i numery telefonów pracowników
SELECT LastName, HomePhone FROM Employees

-- Wybierz nazwy i ceny produktów
SELECT ProductName, UnitPrice FROM Products

-- Pokaż wszystkie kategorie produktów (nazwy i opisy)
SELECT CategoryName, Description FROM Categories

-- Pokaż nazwy i adresy stron www dostawców
SELECT CompanyName, HomePage FROM Suppliers