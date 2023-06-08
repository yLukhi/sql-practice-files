SELECT officerClass / *
FROM employeeNZone;
SELECT DISTINCT officerClass
SELECT COUNT(DISTINCT officerClass)
WHERE
WHERE =, <, >, <=, >=, <>/!=
-- 
SELECT * / COUNT(SupplierID)
FROM Products
WHERE SupplierID = 2; 
-- 
WHERE salary BETWEEN 50 AND 60;
WHERE birthCity LIKE 's%';/ 
WHERE ProductId IN (1 , 2, 4, 33);/WHERE City IN ('Paris','London');
WHERE officerClass='first' OR/AND  officerClass='second'
WHERE NOT officerClass='first';
WHERE EmployeeID BETWEEN 5 AND 10 AND (FirstName='Anne');
/ WHERE EmployeeID BETWEEN 5 AND 10 AND NOT(FirstName='Anne');
-- 
-- IMP query and critical
SELECT * FROM Customers
ORDER BY Country, CustomerName ASC/DESC;
-- The following SQL statement selects all customers from the "Customers" table, sorted 
-- by the "Country" and the "CustomerName" column. This means that it orders by Country, 
-- but if some rows have the same Country, it orders them by CustomerName:
--
INSERT INTO table_name (column1name, column2name, column3name, ...) / table_name
VALUES (value1, value2, value3, ...);
-- dont insert indexValue(primary key/CoustomerID/Index) which is 
-- usually number and AUTO INCREMENT field which will be generated automatically
--
-- AUTO INCREMENT Field (SQL Database)
CREATE TABLE Persons (
    Personid int IDENTITY(1,1) PRIMARY KEY,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int
);
-- the starting value for IDENTITY is 1, and it will increment by 1 for each new record.
--
-- SQL order of operation 
SELECT
FROM
WHERE
GROUP BY
HAVING
ORDER BY
LIMIT
-- BUT that's not how order of execution happens
-- SO, order of execution goes like this:
FROM and JOIN --(tables are identified)
WHERE --(rowa are filterd)
GROUP BY --(data is grouped)
HAVING --(groups are filtered)
SELECT --(columns are selected)
ORDER BY --(results are ranked)
LIMIT --(results are limited)

-- Rewrite it
FROM and JOIN
where
group BY
having
select
order BY
limit

from and join --tables are identified
where -- rows are filtered
group by -- data is grouped
having -- group are filtered
select -- filtered group's columns are selected
order by -- results ranked
limit -- results are limited
--
WHERE columnName IS NULL/IS NOT NULL;
--
-- IMP Note: be carefull while updating records in a table! Notice the WHERE statement in the UPDATE 
-- statement. If WHERE conditon doesnt satisfie then whole table will be updated + if you omit the 
-- WHERE clause, all records in the table will be updated! and SAME WILL BE APPLIED TO 
-- delete STATEMENT
UPDATE Customers
SET City='Surat', PostalCode=395006
WHERE CustomerName='Cardinal';
--
DELETE FROM Customers 
WHERE CustomerName='Alfreds Futterkiste';
--
-- IMP Note: Not all database systems support the SELECT TOP clause. MySQL uses LIMIT, while 
-- Oracle uses something else
SELECT * FROM Customers LIMIT 3;
/ SELECT * FROM Customers LIMIT 3;
--
SELECT MIN/MAX(Price) AS SmallestPrice
FROM Products;
-- ANS WILL BE: SmallestPrice 77(total rows, since there is no conditions)
-- 
SELECT COUNT(SupplierID) 
FROM Products
WHERE SupplierID = 2;
-- ANS WILL BE: Expr1000 4 (since there has not used AS conlumn_name)
-- 
SELECT SUM(Quantity) 
FROM OrderDetails;
-- 
SELECT * 
FROM Customers like 'a%';
-- A 'wildcard' character is used to substitute one or more characters in a string
-- LIKE Operator 	Description
-- WHERE CustomerName LIKE 'a%' 	Finds any values that start with "a"
-- WHERE CustomerName LIKE '%a' 	Finds any values that end with "a"
-- WHERE CustomerName LIKE '%or%' 	Finds any values that have "or" in any position
-- WHERE CustomerName LIKE '_r%' 	Finds any values that have "r" in the second position
-- WHERE CustomerName LIKE 'a_%' 	Finds any values that start with "a" and are at least 2 characters in length
-- WHERE CustomerName LIKE 'a__%' 	Finds any values that start with "a" and are at least 3 characters in length
-- WHERE ContactName LIKE 'a%o' 	Finds any values that start with "a" and ends with "o"
-- 


