USE Northwind

-- Dla kazdej kategorii produktu, podaj laczna liczba zamowionych jednostek
SELECT CategoryName, SUM(Quantity) AS TotalNumOrderedItems
FROM Categories C
INNER JOIN Products P on C.CategoryID = P.CategoryID
INNER JOIN [Order Details] O on P.ProductID = O.ProductID
GROUP BY CategoryName

-- Dla kazdego zamowienia podaj laczna liczbe zamowionych jednostek oraz nazwe klienta
SELECT O.OrderID, SUM(O2.Quantity) QuantitySum, CompanyName
FROM Orders O
INNER JOIN Customers C ON O.CustomerID = C.CustomerID
INNER JOIN [Order Details] O2 ON O.OrderID = O2.OrderID
GROUP BY  O.OrderID, CompanyName
ORDER BY 1, 3

-- Dla kazdego klienta (nazwa) podaj wartosc poszczegolnych zamowien.
-- Gdy klient nie nie zamowil tez powinna pojawic sie informacja
SELECT CompanyName, O.OrderID, SUM(UnitPrice * Quantity * (1 - Discount)) AS Total
FROM Customers C
LEFT JOIN Orders O on C.CustomerID = O.CustomerID
LEFT JOIN [Order Details] OD on OD.OrderID = O.OrderID
GROUP BY CompanyName, O.OrderID
ORDER BY 3

-- Podzapytania

-- Uzyte w miejsu, gdzie pojawia sie nazwa tabeli
-- Uzycie podzapytania w tym przykladzie niczego nie wnosi (przyklad teoretyczno-pogladowy)
SELECT T.OrderID, T.CustomerID
FROM (SELECT Orders.OrderID, Orders.CustomerID FROM Orders) AS T

-- Skalarne - zwracaja pojedyncza wartosc
SELECT ProductName, UnitPrice,
       (SELECT AVG(UnitPrice) FROM Products) AS Average,
       UnitPrice - (SELECT AVG(UnitPrice) FROM Products) AS Difference
FROM Products

-- Skorelowane

-- Dla każdego produktu podaj jego nazwę kategorii, nazwę produktu, cenę,
-- średnią cenę wszystkich produktów danej kategorii oraz różnicę między ceną produktu
-- a średnią ceną wszystkich produktów danej kategorii
SELECT P.CategoryId, ProductName, CategoryName, UnitPrice,
       (SELECT AVG(UnitPrice) FROM Products P2 WHERE P.CategoryId = P2.CategoryId) AS CategoryAverage,
       UnitPrice - (SELECT AVG(UnitPrice) FROM Products P2 WHERE P.CategoryId = P2.CategoryId) AS CategoryDifference
FROM Products P
INNER JOIN Categories C on P.CategoryID = C.CategoryID

SELECT AVG(UnitPrice) FROM Products P2 WHERE 1 = P2.CategoryId

SELECT AVG(UnitPrice) FROM Products P2

-- Podaj laczna wartosc zamowienia o numerze 10250
-- uwzglednij cene za przesylke (fracht nie moze byc pod suma)
SELECT O.OrderID,
       SUM(UnitPrice * Quantity * (1 - Discount)) + (SELECT Freight FROM Orders O2 WHERE O.OrderID = O2.OrderID) TotalPayment
FROM Orders O
INNER JOIN [Order Details] OD on OD.OrderID = O.OrderID
WHERE OD.OrderID = 10250
GROUP BY O.OrderID

-- Teraz dla kazdego zamowienia
SELECT O.OrderID,
       SUM(UnitPrice * Quantity * (1 - Discount)) + (SELECT Freight FROM Orders O2 WHERE O.OrderID = O2.OrderID) TotalPayment
FROM Orders O
INNER JOIN [Order Details] OD on OD.OrderID = O.OrderID
--WHERE OD.OrderID = 10250
GROUP BY O.OrderID

-- lub

SELECT OD.OrderID,
       SUM(UnitPrice * Quantity * (1 - Discount)) + (SELECT Freight FROM Orders O WHERE OrderID = OD.OrderID) AS PriceWithFreight
FROM [Order Details] AS OD
GROUP BY OrderID

-- Podaj produkty kupowane przez wiecej niz jednego klienta
-- DISTINCT, bo ten sam klient moze kupic wiele razy ten sam produkt
SELECT ProductID, COUNT(DISTINCT CustomerID) AS NumOfCustomers
FROM [Order Details] AS OD
INNER JOIN Orders O on OD.OrderID = O.OrderID
GROUP BY ProductID
HAVING COUNT(DISTINCT CustomerID) > 1
ORDER BY NumOfCustomers


------------------------------

-- 1. Podaj liczbę̨ zamówien obsłużonych przez każdego pracownika w 1997 roku.
-- Dodatkowo dla każdego pracownika podaj informację o tym, kiedy obsłużył ostatnie
-- zamówienie (najpóźniejsza data zamówienia).
-- Zbiór wynikowy powinien zawierac: imię̨ i nazwisko pracownika, liczbę̨ obsłużonych zamówien. Interesują nas tylko
-- pracownicy, którzy w roku 1997 obsłużyli co najmniej 3 zamówienia

SELECT E.EmployeeID, E.LastName, E.FirstName, COUNT(OrderID) NumOfOrders, MAX(O.OrderDate) RecentDate
FROM Employees E
INNER JOIN Orders O ON E.EmployeeID = O.EmployeeID
WHERE YEAR(OrderDate) = '1997'
GROUP BY E.EmployeeID, E.LastName, E.FirstName
HAVING COUNT(OrderID) > 2
ORDER BY E.EmployeeID

--- albo

SELECT O.EmployeeID, E.LastName, E.FirstName,
       (SELECT COUNT(OrderID) FROM Orders O2 WHERE O2.EmployeeID = O.EmployeeID AND YEAR(OrderDate) = '1997') AS NumOfOrders,
       MAX(O.OrderDate) RecentDate
FROM Orders O
INNER JOIN Employees E ON E.EmployeeID = O.EmployeeID
WHERE YEAR(OrderDate) = '1997'
GROUP BY O.EmployeeID, E.LastName, E.FirstName
HAVING COUNT(OrderID) > 2
ORDER BY O.EmployeeID

SELECT COUNT(OrderID) FROM Orders WHERE EmployeeID=1 AND YEAR(OrderDate) = '1997' HAVING COUNT(OrderID) > 2


-- 2. Podaj nazwy klientów oraz łączną wartość ich zamówień przewożonych przez firmę ‘united packane’.
-- Dla każdego klienta podaj : nazwę klienta, wartość zamówień (uwzględnij rabat).
-- Interesują nas tylko klienci którym firma ‘united package’ przewiozła co najmniej dwie przesyłki

SELECT C.CompanyName, SUM(UnitPrice * Quantity * (1 - Discount)) AS TotalSpent
FROM [Order Details] O2
INNER JOIN Orders O ON O2.OrderID = O.OrderID
INNER JOIN Customers C ON O.CustomerID = C.CustomerID
INNER JOIN Shippers s ON O.ShipVia = S.ShipperID
WHERE S.CompanyName = 'United Package'
GROUP BY C.CompanyName
HAVING Count(O.OrderID) >= 2

--- albo

SELECT DISTINCT C.CompanyName, SUM(UnitPrice * Quantity * (1 - Discount)) AS TotalSpent
FROM Customers C
INNER JOIN Orders O ON C.CustomerID = O.CustomerID
INNER JOIN [Order Details] OD ON O.OrderID = OD.OrderID
INNER JOIN Shippers S ON O.ShipVia = S.ShipperID
WHERE O.ShipVia = (SELECT ShipperID FROM Shippers S2 WHERE S2.CompanyName LIKE 'United Package')
GROUP BY C.CompanyName
HAVING Count(O.OrderID) >= 2
