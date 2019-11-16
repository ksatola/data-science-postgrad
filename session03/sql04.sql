SELECT *
FROM orderhist

SELECT productid
   ,SUM(quantity) AS total_quantity
 FROM orderhist
 GROUP BY productid

SELECT productid, SUM(quantity) AS total_quantity
 FROM orderhist
 WHERE productid = 2
 GROUP BY productid

-- dla kazdego zamowienia podaj sumaryczna ilosc sztuk zamowionego towaru

SELECT orderid, SUM(quantity) AS total_quantity
 FROM orderhist
 GROUP BY orderid

-- Napisz polecenie, które zwraca informacje o zamówieniach z tablicy order details. Zapytanie ma grupować i wyświetlać identyfikator każdego produktu a następnie obliczać ogólną zamówioną ilość. Ogólna ilość jest sumowana funkcją agregującą SUM i wyświetlana jako jedna wartość dla każdego produktu.

SELECT productid, SUM(quantity) AS total_quantity
 FROM [order details]
 GROUP BY productid

-- Podaj maksymalną cenę zamawianego produktu dla każdego zamówienia

SELECT orderid, MAX([Order Details].UnitPrice)
FROM [Order Details]
GROUP BY orderID

-- Posortuj zamówienia wg maksymalnej ceny produktu

SELECT orderid, MAX([Order Details].UnitPrice) AS maxprice
FROM [Order Details]
GROUP BY orderid
ORDER BY maxprice DESC

-- Podaj maksymalną i minimalną cenę zamawianego produktu dla każdego zamówienia
SELECT MAX()
FROM or


-- Podaj liczbę zamówień dostarczanych przez poszczególnych spedytorów (przewoźników)
SELECT COUNT(*)
FROM Orders
GROUP BY shipvia

-- Który z spedytorów był najaktywniejszy w 1997 roku
SELECT ShipVia, COUNT(*)
FROM Orders
WHERE YEAR(ShippedDate) = 1997
GROUP BY ShipVia
ORDER BY Count(*)