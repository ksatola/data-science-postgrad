USE library

-- Napisz polecenie, ktore wyswietla liste dzieci bedacych czlonkami biblioteki.
-- Interesuje nas imie, nazwisko i data urodzenia dziecka
SELECT m.firstname, m.lastname, j.birth_date, m.member_no
FROM member AS m
    INNER JOIN juvenile AS j
        ON m.member_no = j.member_no

-- Napisz polecenie, ktore podaje tytuly aktualnie wypozyczonych ksiazek
-- ksiazki wypozyczone znajduja sie w tabeli loan (ksiazek niewypozyczonych tam nie ma)
SELECT DISTINCT t.title
FROM title AS t
    INNER JOIN loan AS l
        ON t.title_no = l.title_no

-- Podaj informacje o karach zaplaconych za przetrzymywanie ksiazki o tytule
-- 'Tao Teh King'. Interesuje nas data oddania ksiazki, ile dni byla przetrzymywana
-- i jaka zaplacono kare
SELECT title.title,
       loanhist.in_date,
       DATEDIFF(d, loanhist.in_date, loanhist.due_date) AS [beyond loan days],
       loanhist.fine_paid
FROM loanhist
    INNER JOIN title
        ON loanhist.title_no = title.title_no
WHERE title.title = 'Tao Teh King' AND loanhist.fine_paid IS NOT NULL

-- Napisz polecenie, ktore podaje liste ksiazek (numery ISBN)
-- zarezerwowanych przez osobe o nazwisku: Stephen A. Graff
SELECT r.isbn, m.firstname, m.middleinitial, m.lastname
FROM reservation AS r
    INNER JOIN member AS m
        ON r.member_no = m.member_no
WHERE m.firstname = 'Stephen' AND m.middleinitial = 'A' AND m.lastname = 'Graff'
