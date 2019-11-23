USE Library

SELECT * FROM member

-- UNION - duplikaty usuniete - suma zbiorow wynikowych
-- EXCEPT
-- INTER

-- Podaj czytelnikow, ktorzy nigdy nie pozyczyli zadnej ksiazki
SELECT m.member_no, firstname, lastname
FROM member m
LEFT JOIN loan l ON l.member_no = m.member_no
LEFT JOIN loanhist l2 on l.member_no = l2.member_no
WHERE l.isbn IS NULL AND l2.isbn IS NULL
--WHERE l.member_no IS NULL AND l2.member_no IS NULL

