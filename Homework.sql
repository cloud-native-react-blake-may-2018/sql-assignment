SQL Lab

1.0	Setting up Oracle Chinook
In this section you will begin the process of working with the Oracle Chinook database
Task – Open the Chinook_Oracle.sql file and execute the scripts within.
2.0 SQL Queries
In this section you will be performing various queries against the Oracle Chinook database.

2.1 SELECT
Task – Select all records from the Employee table.
SELECT * from Employee;

Task – Select all records from the Employee table where last name is King.
SELECT * from Employee
WHERE LASTNAME = 'King';

Task – Select all records from the Employee table where first name is Andrew and REPORTSTO is NULL.
SELECT * from Employee
WHERE firstname = 'Andrew';

2.2 ORDER BY
Task – Select all albums in Album table and sort result set in descending order by title.
SELECT * from Album
ORDER BY title DESC;

Task – Select first name from Customer and sort result set in ascending order by city
SELECT firstname FROM Customer
ORDER BY firstname ASC;

2.3 INSERT INTO
Task – Insert two new records into Genre table
INSERT INTO Genre
VALUES (26, null);
INSERT INTO Genre
VALUES (27, null);

Task – Insert two new records into Employee table
Select * From Employee;
INSERT INTO Employee (EMPLOYEEID, LASTNAME, FIRSTNAME)
VALUES (9, 'Bob', 'Billy');
INSERT INTO Employee (EMPLOYEEID, LASTNAME, FIRSTNAME)
VALUES (10, 'Pheonix','Paul');

Task – Insert two new records into Customer table
select * from customer;
INSERT INTO Customer (customerid, firstname, lastname, email)
VALUES (60, 'Jim', 'Bo', 'jim.bo@yahoo.com');
INSERT INTO Customer (customerid, firstname, lastname, email)
VALUES (61, 'Yale', 'Geet', 'pork.chop@gmail.com');

2.4 UPDATE
Task – Update Aaron Mitchell in Customer table to Robert Walter
UPDATE Customer
SET firstname = 'Robert', lastname = 'Walter'
WHERE firstname = 'Aaron' and lastname = 'Mitchell';

Task – Update name of artist in the Artist table “Creedence Clearwater Revival” to “CCR”
UPDATE Artist
SET name = 'CCR'
WHERE name = 'Creedence Clearwater Revival';

2.5 LIKE
Task – Select all invoices with a billing address like “T%”
SELECT * FROM invoice
WHERE billingaddress Like 'T%';

2.6 BETWEEN
Task – Select all invoices that have a total between 15 and 50
SELECT * FROM invoice
WHERE total BETWEEN 15 AND 50;

Task – Select all employees hired between 1st of June 2003 and 1st of March 2004
SELECT * FROM employee
WHERE hiredate 
BETWEEN TO_DATE('2003-06-01','yyyy-mm-dd') 
AND TO_DATE('2004-03-01','yyyy-mm-dd');

2.7 DELETE
Task – Delete a record in Customer table where the name is Robert Walter (There may be constraints that rely on this, find out how to resolve them).
ALTER TABLE customer
DISABLE CONSTRAINT pk_customer CASCADE;
DELETE FROM customer
WHERE firstname = 'Robert' AND lastname = 'Walter';

3.0	SQL Functions
In this section you will be using the Oracle system functions, as well as your own functions, to perform various actions against the database
3.1 System Defined Functions
Task – Use a function that returns the current time.
SELECT TO_CHAR(LOCALTIMESTAMP, 'HH:MI:SS')
from dual;

Task – Use a function that returns the length of a mediatype from the mediatype table

3.2 System Defined Aggregate Functions
Task – Use a function that returns the average total of all invoices
SELECT AVG(total) FROM invoice;

Task – Use a function that returns the most expensive track
SELECT MAX(unitprice) FROM track;

7.0 JOINS
In this section you will be working with combing various tables through the use of joins. You will work with outer, inner, right, left, cross, and self joins.
7.1 INNER
Task – Create an inner join that joins customers and orders and specifies the name of the customer and the invoiceId.
SELECT customer.firstname, customer.lastname, invoice.invoiceId
FROM customer
INNER JOIN invoice ON invoice.CustomerID = customer.CustomerID;

7.2 OUTER
Task – Create an outer join that joins the customer and invoice table, specifying the CustomerId, firstname, lastname, invoiceId, and total.
SELECT customer.customerid, customer.firstname, customer.lastname, invoice.invoiceId, invoice.total
FROM customer
FULL JOIN invoice ON invoice.CustomerID = customer.CustomerID;

7.3 RIGHT
Task – Create a right join that joins album and artist specifying artist name and title.
SELECT album.title, artist.name
FROM album
RIGHT JOIN artist ON album.artistid = artist.artistid;

7.4 CROSS
Task – Create a cross join that joins album and artist and sorts by artist name in ascending order.
SELECT * FROM Album 
CROSS JOIN Artist
ORDER BY Artist.name ASC;

7.5 SELF
Task – Perform a self-join on the employee table, joining on the reportsto column.
SELECT * FROM employee employee1
INNER JOIN employee employee2 ON employee1.reportsto = employee2.employeeid;

commit;
