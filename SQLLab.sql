--SQL Lab
--
--1.0	Setting up Oracle Chinook
--In this section you will begin the process of working with the Oracle Chinook database
--Task – Open the Chinook_Oracle.sql file and execute the scripts within.
select * from customer;

--2.0 SQL Queries
--In this section you will be performing various queries against the Oracle Chinook database.
--2.1 SELECT
--Task – Select all records from the Employee table.
SELECT * FROM employee;

--Task – Select all records from the Employee table where last name is King.
SELECT * FROM employee  WHERE lastname = 'King';

--Task – Select all records from the Employee table where first name is Andrew and REPORTSTO is NULL.
SELECT * FROM employee WHERE firstname = 'Andrew';

--2.2 ORDER BY
--Task – Select all albums in Album table and sort result set in descending order by title.
SELECT title FROM album 
ORDER BY title DESC;

--Task – Select first name from Customer and sort result set in ascending order by city
SELECT firstname, city FROM customer
ORDER BY city;

--2.3 INSERT INTO
--Task – Insert two new records into Genre table
INSERT INTO Genre (GenreId, Name) VALUES (26, 'Electronic');
INSERT INTO Genre (GenreId, Name) VALUES (27, 'Rap');
SELECT * FROM genre;

--Task – Insert two new records into Employee table
INSERT INTO employee (employeeid, lastname, firstname, title, reportsto, birthdate, hireDate, address, city, state, country, postalcode) 
VALUES (10, 'Hudson', 'Jack', 'Boss', 5, '30-NOV-95', '12-JAN-17', '1234 N Road wy', 'Riverside', 'CA', 'USA', 92374);
INSERT INTO employee (employeeid, lastname, firstname) VALUES (9, 'Hudson', 'Fernando');
SELECT * FROM employee;

--Task – Insert two new records into Customer table
INSERT INTO customer (customerid, firstname, lastname, email) 
VALUES (60, 'Guy', 'Friend', 'guyfriend@hotmail.com');
INSERT INTO customer (customerid, firstname, lastname, email) 
VALUES (61, 'Fred', 'Burgerson', 'fredburger@hotmail.com');
SELECT * FROM customer;

--2.4 UPDATE
--Task – Update Aaron Mitchell in Customer table to Robert Walter
UPDATE customer
SET firstname = 'Robert', lastname = 'Walker'
WHERE firstname = 'Aaron';

--SELECT * FROM customer WHERE lastname = 'Mitchell';

--Task – Update name of artist in the Artist table “Creedence Clearwater Revival” to “CCR”
UPDATE artist 
SET name ='CCR'
WHERE name = 'Creedence Clearwater Revival' ;
--SELECT * FROM artist;

--2.5 LIKE
--Task – Select all invoices with a billing address like “T%”
SELECT * FROM invoice WHERE billingaddress LIKE 'T%' ;

--2.6 BETWEEN
--Task – Select all invoices that have a total between 15 and 50
SELECT * FROM invoice;
SELECT * FROM invoice WHERE total > 15 AND total < 50;

--Task – Select all employees hired between 1st of June 2003 and 1st of March 2004
SELECT * FROM employee;
SELECT * FROM employee WHERE hiredate BETWEEN '1-JUN-03' AND '1-MAR-04';


--2.7 DELETE
--Task – Delete a record in Customer table where the name is Robert Walter (There may be constraints that rely on this, find out how to resolve them).
SELECT * FROM customer WHERE lastname = 'Walker';

 ALTER TABLE customer
    DISABLE CONSTRAINT PK_Customer CASCADE;
     
DELETE FROM customer
    WHERE firstname = 'Robert' AND  lastname = 'Walker';
    
--3.0	SQL Functions
--In this section you will be using the Oracle system functions, as well as your own functions, to perform various actions against the database

--3.1 System Defined Functions
--Task – Use a function that returns the current time.
  -- SELECT (SYSDATE) FROM DUAL;                          --  USE FOR FINDING DATE
  -- SELECT LOCALTIMESTAMP FROM DUAL;                     --USE FOR FINDING DATE AND TIME TIMESTAMP
   
SELECT TO_CHAR
    (LOCALTIMESTAMP, 'HH:MI:SS')                            --USE FOR TURNING TIMESTAMP TO BE EASIER TO READ
     FROM DUAL;

--Task – Use a function that returns the length of a mediatype from the mediatype table
SELECT * FROM  mediatype;
SELECT * FROM mediatype
    WHERE mediatypeid = 1;
SELECT LENGTH(name) 
    FROM MEDIATYPE;            --FOR ALL MEDIATYPE LENGTHS
SELECT LENGTH(name) 
    FROM MEDIATYPE
    WHERE mediatypeid = 1;    --FOR INDIVIDUAL MEDIATYPE LENGTH BY MEDIATYPEID

--3.2 System Defined Aggregate Functions
--Task – Use a function that returns the average total of all invoices
SELECT * FROM invoice;
SELECT AVG(total) FROM invoice;

--Task – Use a function that returns the most expensive track
SELECT * FROM track;

SELECT MAX(Unitprice) FROM track;

--7.0 JOINS
--In this section you will be working with combing various tables through the use of joins. You will work with outer, inner, right, left, cross, and self joins.

--7.1 INNER
--Task – Create an inner join that joins customers and orders and specifies the name of the customer and the invoiceId.
SELECT * FROM customer;
SELECT * FROM invoice;
SELECT  firstname, lastname,invoiceid
    FROM customer
    INNER JOIN invoice
    ON customer.customerid = invoice.customerid;

--7.2 OUTER
--Task – Create an outer join that joins the customer and invoice table, specifying the CustomerId, firstname, lastname, invoiceId, and total.
SELECT * FROM customer;
SELECT * FROM invoice;

SELECT invoice.customerid, firstname, lastname, invoiceid, total
FROM customer
FULL OUTER JOIN invoice
ON customer.customerid = invoice.customerid;

--7.3 RIGHT
--Task – Create a right join that joins album and artist specifying artist name and title.
SELECT * FROM album;
SELECT * FROM artist;
SELECT name, title
FROM  album
RIGHT JOIN artist 
ON album.artistid = artist.artistid;

--7.4 CROSS
--Task – Create a cross join that joins album and artist and sorts by artist name in ascending order.
SELECT * FROM album;
SELECT * FROM artist;

SELECT name, title 
FROM album, 
artist ORDER BY Artist.Name ASC;

--7.5 SELF
--Task – Perform a self-join on the employee table, joining on the reportsto column.
SELECT * FROM employee;

SELECT 
     employeeid, lastname, firstname, reportsto
FROM
    employee;