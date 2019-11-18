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

-- Napisz polecenie, ktore wyswietla liste dzieci bedacych czlonkami biblioteki.
-- Interesuje nas imie, nazwisko, data urodzenia dziecka i adres zamieszkania dziecka
SELECT m.firstname, m.lastname, j.birth_date, a.street, a.city, a.state, a.zip
FROM member m
INNER JOIN juvenile j ON m.member_no = j.member_no
INNER JOIN adult a ON j.adult_member_no = a.member_no

-- Napisz polecenie, ktore wyswietla liste dzieci bedacych czlonkami biblioteki.
-- Interesuje nas imie, nazwisko, data urodzenia dziecka, adres zamieszkania dziecka
-- oraz imie i nazwisko rodzica
SELECT kid.firstname [Kid First Name], kid.lastname [Kid Last Name], j.birth_date [Kid Birth Date],
       a.street [Street], a.city [City], a.state [State], a.zip [ZIP],
       parent.firstname [Parent First Name], parent.lastname [Parent Last Name]
FROM member kid
INNER JOIN juvenile j ON kid.member_no = j.member_no
INNER JOIN adult a ON j.adult_member_no = a.member_no
INNER JOIN member parent ON parent.member_no = a.member_no

-- Wybierz rodzicow (zapytanie pomocnicze - niepotrzebne w finalnej wersji)
SELECT m.firstname, m.lastname
FROM member m
INNER JOIN adult a on m.member_no = a.member_no

-- Napisz polecenie, ktore wyswietla adresy czlonkow biblioteki,
-- ktorzy maja dzieci urodzone przez 1 stycznia 1996
SELECT a.street, a.city, a.state, a.zip--, j.birth_date
FROM member m
INNER JOIN adult a ON a.member_no = m.member_no
INNER JOIN juvenile j ON a.member_no = j.adult_member_no
WHERE j.birth_date < '1996-01-01'

-- ???
-- Napisz polecenie, ktore wyswietla adresy czlonkow biblioteki,
-- ktorzy maja dzieci urodzone przez 1 stycznia 1996.
-- Interesuja nas tylko adresy takich czlonkow biblioteki,
-- ktorzy aktuanie nie przetrzymuja ksiazek
SELECT a.street, a.city, a.state, a.zip, l.isbn--, j.birth_date
FROM member m
INNER JOIN adult a ON a.member_no = m.member_no
INNER JOIN juvenile j ON a.member_no = j.adult_member_no
LEFT OUTER JOIN loan l ON m.member_no = l.member_no
WHERE j.birth_date < '1996-01-01' AND l.isbn IS NULL

-- Napisz polecenie, ktore zwraca imie i nazwisko (jako pojedyncza kolumne - name),
-- oraz informacje o adresie: ulica, miasto, stan, kod (jako pojedyncza kolumne - address)
-- dla wszystkich doroslych czlonkow biblioteki
SELECT (m.firstname + ' ' + m.lastname) AS name,
       (a.street + ', ' + a.city + ', ' + a.state + ', ' + a.zip) AS address
FROM member m
INNER JOIN adult a ON m.member_no = a.member_no

