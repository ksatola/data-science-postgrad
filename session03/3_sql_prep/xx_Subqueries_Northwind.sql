USE Northwind

-- W miejscu, w ktorym mozemy uzyc nazwy tabeli, mozemy uzyc podzapytania
SELECT T.OrderID, T.CustomerID
FROM (SELECT Orders.OrderID, Orders.CustomerID FROM Orders) AS T

-- Podzapytanie zwraca pojedyncza wartosc
-- Podzapytanie moze byc traktowane jako wyrazenie i moze pojawic sie na liscie SELECT
SELECT Products.ProductName, Products.UnitPrice,
       (SELECT AVG(UnitPrice) FROM Products) AS Average,
       Products.UnitPrice - (SELECT AVG(UnitPrice) FROM Products) AS Difference
FROM Products

SELECT AVG(UnitPrice) FROM Products

-- Podzapytanie jest wykonywane tylko raz

-- Podzapytanie moze byc uzyte w warunku
SELECT Products.ProductName, Products.UnitPrice,
       (SELECT AVG(UnitPrice) FROM Products) AS Average,
       Products.UnitPrice - (SELECT AVG(UnitPrice) FROM Products) AS Difference
FROM Products
WHERE UnitPrice > (SELECT AVG(UnitPrice) FROM Products)

-- Podzapytania skorelowane
-- Dla kazdego produktu podaj maksymalna liczbe zamowionych jednostek
SELECT DISTINCT ProductID, Quantity
FROM [Order Details] AS ord1
WHERE quantity = (
    SELECT MAX(Quantity) FROM [Order Details] AS ord2
    WHERE ord1.ProductID = ord2.ProductID
    )
ORDER BY ProductID

-- To samo przy uzyciu GROUP BY
SELECT ProductID, MAX(Quantity)
FROM [Order Details]
GROUP BY ProductID
ORDER BY ProductID

-- Operatory EXISTS, NOT EXISTS
-- Zewnetrzne zapytanie testuje wystapienie (lub nie) zbioru wynikowego
-- okreslonego przez zapytanie wewnetrzne (ktore zwraca TRUE lub FALSE)
-- Podaj liste wszystkich pracownikow, ktorzy obsluzyli zamowienie '9/5/97'
SELECT LastName, EmployeeID
FROM Employees As E
WHERE EXISTS (
    SELECT * FROM Orders AS O
    WHERE E.EmployeeID = O.EmployeeID AND O.OrderDate = '9/5/97'
    )

-- To samo za pomoca JOIN
SELECT DISTINCT LastName, E.EmployeeID
FROM Employees AS E
INNER JOIN Orders O on E.EmployeeID = O.EmployeeID
WHERE OrderDate = '9/5/97'

-- Podaj liste wszystkich pracownikow, ktorzy NIE obsluzyli zamowienia '9/5/97'
SELECT LastName, EmployeeID
FROM Employees As E
WHERE NOT EXISTS (
    SELECT * FROM Orders AS O
    WHERE E.EmployeeID = O.EmployeeID AND O.OrderDate = '9/5/97'
    )

-- Operatory IN, NOT IN
-- Podaj liste wszystkich pracownikow, ktorzy obsluzyli zamowienie '9/5/97'
SELECT LastName, EmployeeID
FROM Employees As E
WHERE EmployeeID IN (
    SELECT EmployeeID
    FROM Orders AS O
    WHERE OrderDate = '9/5/97'
    )

-- pomocnicze
SELECT EmployeeID
FROM Orders AS O
WHERE OrderDate = '9/5/97'