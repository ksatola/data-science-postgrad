USE Joindb

SELECT * FROM Sales

SELECT * FROM Produce

SELECT * FROM Buyers

-- Przyklad 1: bez aliasu nazwy tabeli

SELECT Buyers.buyer_name, Sales.buyer_id, Sales.qty
FROM Buyers, Sales
WHERE Buyers.buyer_id = Sales.buyer_id

-- Przyklad 2: z aliasem nazwy tabeli

SELECT buyer_name, s.buyer_id, qty
FROM buyers AS b, sales AS s
WHERE b.buyer_id = s.buyer_id

-- Przyklad 3: bez aliasu nazwy tabeli

SELECT Buyers.buyer_name, Sales.buyer_id, Sales.qty
FROM Buyers
INNER JOIN Sales
    ON Buyers.buyer_id = Sales.buyer_id

-- Przyklad 4: z aliasem nazwy tabeli

SELECT b.buyer_name, s.buyer_id, s.qty
FROM Buyers AS b
INNER JOIN Sales AS s
    ON b.buyer_id = s.buyer_id

-- Iloczyn kartezjanski

SELECT b.buyer_name AS [b.buyer_name],
       b.buyer_id AS [b.buyer_id],
       s.buyer_id AS [s.buyer_id],
       qty AS [s.qty]
FROM Buyers AS b, Sales AS s

-- Warunek

SELECT b.buyer_name AS [b.buyer_name],
       b.buyer_id AS [b.buyer_id],
       s.buyer_id AS [s.buyer_id],
       qty AS [s.qty]
FROM Buyers AS b, Sales AS s
WHERE b.buyer_name = 'Adam Barr'

-- Zlaczenie

SELECT b.buyer_name AS [b.buyer_name],
       b.buyer_id AS [b.buyer_id],
       s.buyer_id AS [s.buyer_id],
       qty AS [s.qty]
FROM Buyers AS b, Sales AS s
WHERE s.buyer_id = b.buyer_id
    AND
    b.buyer_name = 'Adam Barr'

-- Zlaczenie wewnetrzne

SELECT b.buyer_name, b.buyer_id,s.qty
FROM Buyers as b
INNER JOIN Sales s
    ON b.buyer_id = s.buyer_id

-- Zlaczenie zewnetrzne

SELECT b.buyer_name, s.buyer_id, s.qty
FROM Buyers b
LEFT OUTER JOIN Sales s
    ON b.buyer_id = s.buyer_id

-- CROSS JOIN - iloczyn kartezjanski

SELECT Buyers.buyer_name, Sales.qty
FROM Buyers
    CROSS JOIN Sales

-- Laczenie wiecej niz 2 tabel

SELECT B.buyer_name, P.prod_name, S.qty
FROM Buyers B
    INNER JOIN Sales S
        ON B.buyer_id = S.buyer_id
    INNER JOIN Produce P
        ON S.prod_id = P.prod_id

-- Laczenie tabeli samej ze soba - self join

-- Napisz polecenie, ktore wyswietla liste wszystkich kupujacych te same produkty

SELECT S.buyer_id buyer1, S.prod_id, S2.buyer_id buyer2
FROM Sales S
INNER JOIN Sales S2 ON S.prod_id = S2.prod_id

-- Zmodyfikuj poprzedni przyklad, tak aby zlikwidowac duplikaty

-- Usun rekordy odnoszace sie do tego samego buyer_id

SELECT S.buyer_id buyer1, S.prod_id, S2.buyer_id buyer2
FROM Sales S
INNER JOIN Sales S2 ON S.prod_id = S2.prod_id
WHERE S.buyer_id <> S2.buyer_id

-- Usun symatryczne rekordy

SELECT S.buyer_id buyer1, S.prod_id, S2.buyer_id buyer2
FROM Sales S
INNER JOIN Sales S2 ON S.prod_id = S2.prod_id
WHERE S.buyer_id < S2.buyer_id