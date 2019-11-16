-- Podaj liczbę produktów o cenach mniejszych niż 10$ lub większych niż 20$

SELECT COUNT(*)
FROM Products
WHERE UnitPrice < 10 OR UnitPrice > 20

-- Podaj maksymalną cenę produktu dla produktów o cenach poniżej 20$

-- Podaj maksymalną i minimalną i średnią cenę produktu dla produktów o produktach sprzedawanych w butelkach (‘bottle’)


-- Wypisz informację o wszystkich produktach o cenie powyżej średniej


-- !!! funkcja agregujaca nie moze wystapic w WHERE
SELECT *
FROM Products
WHERE UnitPrice > AVG(UnitPrice)

------

SELECT *
FROM Products
WHERE UnitPrice > 28.8663

------

SELECT AVG(UnitPrice)
FROM Products

SELECT *
FROM Products
WHERE UnitPrice > (SELECT AVG(UnitPrice)
FROM Products)

-- Podaj sumę/wartość zamówienia o numerze 10250


--