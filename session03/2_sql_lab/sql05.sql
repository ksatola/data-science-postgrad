SELECT productid, orderid, quantity
FROM orderhist

-- W having maja byc agregaty, a w WHERE nie moglo byc agregatow

SELECT productid, SUM(quantity) AS total_quantity
 FROM orderhist
 GROUP BY productid
 HAVING SUM(quantity)>=30

-- przykl ze slajdow


-- Wyświetl zamówienia dla których liczba pozycji zamówienia jest większa niż 5
SELECT orderid
FROM [Order Details]
GROUP BY orderid
HAVING COUNT(*) >5

-- Wyświetl klientów dla których w 1998 roku zrealizowano więcej
-- niż 8 zamówień (wyniki posortuj malejąco wg łącznej kwoty za
-- dostarczenie zamówień dla każdego z klientów)
SELECT customerid, COUNT(OrderID)
FROM orders
WHERE YEAR(ShippedDate) = 1998
GROUP BY customerid
HAVING COUNT(orderid) > 8
ORDER BY SUM(Freight)


