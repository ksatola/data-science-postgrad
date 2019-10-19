-- Napisz polecenie, które oblicza wartość każdej pozycji 
-- zamówienia o numerze 10250
SELECT * FROM Orders
WHERE OrderID = 10250

SELECT OrderID, ProductID, Discount, 
	(UnitPrice * Quantity) AS TotalPrice, 
	(UnitPrice * Quantity) - (UnitPrice * Quantity) * Discount AS FinalDiscountedPrice
FROM [Order Details]
WHERE OrderID = 10250

-- Napisz polecenie które dla każdego dostawcy (supplier) pokaże
-- pojedynczą kolumnę zawierającą nr telefonu i nr faksu w formacie
-- (numer telefonu i faksu mają być oddzielone przecinkiem)
SELECT Phone, Fax, Phone + ', ' + Fax AS ContactDetails
FROM Suppliers

-- !!!! Wynik bedzie NULL, dlatego trzeba uzywac isnull
SELECT 1 + 2 + NULL

SELECT Phone, Fax, isnull(Phone, 'brak') + ', ' + isnull(Fax, 'brak') AS ContactDetails
FROM Suppliers





-- UWAGA, AS nie jest obowiazkowe
SELECT firstname AS imie, lastname AS nazwisko FROM Employees

SELECT firstname imie, lastname nazwisko FROM Employees

-- Blad logiczny, kolumna firstname zostanie wyswietlona jako nazwisko
SELECT firstname imie lastname nazwisko FROM Employees

-- Name columns as numbers
SELECT firstname '1', lastname '2' FROM Employees

-- Table name containing white characters
SELECT orderid, unitprice, unitprice * 1.05 as newunitprice
FROM [order details]

-- Sting operations
SELECT firstname + ' ' + lastname as imie_nazwisko
FROM employees


