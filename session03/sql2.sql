USE northwind
SELECT COUNT (*)
 FROM employees

-- nie bierze pod uwage nulls
USE northwind
SELECT COUNT(reportsto)
 FROM employees