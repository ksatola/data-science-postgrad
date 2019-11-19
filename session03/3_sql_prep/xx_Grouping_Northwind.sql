USE Northwind

-- Wyswietl 5 pierwszych wierszy zbioru wynikowego, wg Quantity w porzadku malejacym
SELECT TOP 5 [Order Details].OrderID, [Order Details].ProductID, [Order Details].Quantity
FROM [Order Details]
ORDER BY Quantity DESC

-- Dodatkowo zwroc wszystkie elementy o wartosciach takich, jak element ostatni
SELECT TOP 5 WITH TIES [Order Details].OrderID, [Order Details].ProductID, [Order Details].Quantity
FROM [Order Details]
ORDER BY Quantity DESC

-- Wiekszosc funkcji agregujacych ignoruje wartosci NULL
-- Funkcja COUNT(*) zlicza wiersze z wartosciami NULL

--- Policz, ile jest pracownikow w tabeli Employees
SELECT COUNT(*) FROM Employees

-- Policz, ilu pracownikow raportuje do innego pracownika
SELECT COUNT(Employees.ReportsTo) FROM Employees

-- Policz srednia cene jednostkowa dla wszystkich produktow w tabeli Products
SELECT AVG(Products.UnitPrice) FROM Products

-- Zsumuj wszystkie wartosci w kolumnie quantity w tabeli Order Details
SELECT SUM([Order Details].Quantity) FROM [Order Details]

-- Podaj liczbe produktow o cenach mniejszych niz 10$ lub wiekszych niz 20$
SELECT COUNT(ProductID) [Liczba Produktow] FROM Products
WHERE UnitPrice < 10 OR UnitPrice > 20

-- Podaj maksymalna cene produktu dla produktow o cenach ponizej 20$
SELECT MAX(Products.UnitPrice) FROM Products
WHERE UnitPrice < 20

-- Podaj maksymalna i minimalna i srednia cene produktu
-- dla produktow sprzedawanych w butelkach ('bottle')
SELECT MAX(UnitPrice) Max, MIN(UnitPrice) Min, AVG(UnitPrice) Avg FROM Products
WHERE QuantityPerUnit LIKE '%bottle%'

-- Wypisz informacje o wszystkich produktach o cenie powyzej sredniej
SELECT * FROM Products
WHERE UnitPrice >
      (
          SELECT AVG(UnitPrice)
          FROM Products
      )
--ORDER BY UnitPrice ASC

-- control query
SELECT AVG(UnitPrice) FROM Products

-- Podaj sume/wartosc zamowienia o numerze 10250
SELECT SUM(UnitPrice * Quantity - (UnitPrice * Quantity * Discount)) [Wartosc Zamowienia]
FROM [Order Details]
WHERE OrderID = 10250

-- Klauzula GROUP BY
SELECT * FROM orderhist

SELECT productid, SUM(quantity) AS total_quantity
FROM orderhist
GROUP BY productid

SELECT productid, SUM(quantity) AS total_quantity
FROM orderhist
WHERE productid = 2
GROUP BY productid

-- Napisz polecenie, ktore zwraca informacje o zamowieniach z tablicy order details.
-- Zapytanie ma grupowac i wyswietlac id kazdego produktu, a nastepnie obliczac ogolna zamowiona ilosc.
-- Ogolna ilosc jest sumowana funkcja agregujaca SUM i wyswietlana jako jedna wartosc
-- dla kazdego produktu.
SELECT ProductID, SUM(Quantity) [Ogolna Zamowiona Ilosc]
FROM [Order Details]
GROUP BY ProductID

-- Podaj maksymalna cene zamawianego produktu dla kazdego zamowienia
SELECT ProductID, MAX(UnitPrice) [Max Unit Price]
FROM [Order Details]
GROUP BY ProductID

-- Posortuj zamowienia wg maksymalnej ceny produktu
SELECT ProductID, MAX(UnitPrice) [Max Unit Price]
FROM [Order Details]
GROUP BY ProductID
ORDER BY [Max Unit Price] DESC

-- Podaj maksymalna i minimalna cene zamawianego produktu dla kazdego zamowienia
SELECT ProductID, MAX(UnitPrice) [Max Unit Price], MIN(UnitPrice) [Min Unit Price]
FROM [Order Details]
GROUP BY ProductID

-- Podaj liczbe zamowien dostarczanych przez poszczegolnych spedytorow (przewoznikow)
SELECT ShipVia [Shipper Id], COUNT(OrderID) [Liczba Zamowien]
FROM Orders
GROUP BY ShipVia

SELECT ShipVia [Shipper Id], S.CompanyName [Shipper Name], COUNT(OrderID) [Orders Count]
FROM Orders O
INNER JOIN Shippers S ON S.ShipperID = O.ShipVia
GROUP BY ShipVia, S.CompanyName
ORDER BY  ShipVia
