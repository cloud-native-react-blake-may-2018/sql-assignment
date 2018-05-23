--SQL Lab
--
--1.0 Setting up Oracle Chinook
--In this section you will begin the process of working with the Oracle Chinook database
--Task – Open the Chinook_Oracle.sql file and execute the scripts within.
-- DONE!

--2.0 SQL Queries
--In this section you will be performing various queries against the Oracle Chinook database.
--2.1 SELECT
--Task – Select all records from the Employee table.

SELECT * FROM employee;
-- DONE!

--Task – Select all records from the Employee table where last name is King.

SELECT * FROM employee WHERE (lastname = 'King');
-- DONE!

--Task – Select all records from the Employee table where first name is Andrew and REPORTSTO is NULL.

SELECT * FROM employee WHERE (firstname = 'Andrew' AND reportsto IS NULL);
-- DONE!

--2.2 ORDER BY
--Task – Select all albums in Album table and sort result set in descending order by title.

SELECT * FROM album ORDER BY title DESC;
-- DONE!

--Task – Select first name from Customer and sort result set in ascending order by city

SELECT firstname FROM customer ORDER BY city;
-- DONE!

--2.3 INSERT INTO
--Task – Insert two new records into Genre table

SELECT * FROM genre;
INSERT INTO genre (genreid, NAME) VALUES(26, 'Broadway');
INSERT INTO genre (genreid, name) VALUES(27, 'K-Pop');
SELECT * FROM genre;
-- DONE!

--Task – Insert two new records into Employee table

SELECT * FROM employee;
INSERT INTO employee (employeeid, lastname, firstname, title, reportsto, birthdate, hiredate, address, city, state, country,
    postalcode, phone, fax, email) VALUES (9, 'Kingston', 'Alfred', 'IT Staff', 6,
    TO_DATE('1991-03-19 00:00:00', 'yyyy-mm-dd hh24:mi:ss'), TO_DATE('2015-05-02 00:00:00', 'yyyy-mm-dd hh24:mi:ss'),
    '123 Fake St', 'Calgary', 'AB', 'Canada', 'T3B 0C5', '+1 (770) 221-5452', '+1 (403) 246-9800', 'AlKing@chinookcorp.com');
INSERT INTO employee (employeeid, lastname, firstname, title, reportsto, birthdate, hiredate, address, city, state, country,
    postalcode, phone, fax, email) VALUES (10, 'Roberts', 'Alice', 'IT Staff', 6,
    TO_DATE('1991-03-19 00:00:00', 'yyyy-mm-dd hh24:mi:ss'), TO_DATE('2012-05-09 00:00:00', 'yyyy-mm-dd hh24:mi:ss'),
    '404 Knotfound Ave', 'Calgary', 'AB', 'Canada', 'T3B 0C5', '+1 (706) 255-9041', '+1 (403) 246-9707',
    'aroberts@chinookcorp.com');
SELECT * FROM employee;

-- DONE!

--Task – Insert two new records into Customer table

SELECT * FROM customer;
INSERT INTO customer (customerid, firstname, lastname, address, city, state, country, postalcode, phone, email, supportrepid)
    VALUES (60, 'Victoria', 'Huffman', '224 Wither Rd', 'Athens', 'GA', 'USA', '30601', '+1 (706) 367-2121', 'vic22@gmail.com',
    3);
INSERT INTO customer (customerid, firstname, lastname, address, city, state, country, postalcode, phone, email, supportrepid)
    VALUES (61, 'Angela', 'Li', '2109 Argonne Ave', 'Atlanta', 'GA', 'USA', '30318', '+1 (770) 415-4576', 'alli101@gmail.com',
    4);
SELECT * FROM customer;

-- DONE!

--2.4 UPDATE
--Task – Update Aaron Mitchell in Customer table to Robert Walter

SELECT * FROM customer WHERE (firstname = 'Aaron');
UPDATE customer SET firstname = 'Robert', lastname = 'Walter'
    WHERE customerid = 32;
SELECT * FROM customer;

-- DONE!

--Task – Update name of artist in the Artist table “Creedence Clearwater Revival” to “CCR”

SELECT * FROM artist WHERE (name = 'Creedence Clearwater Revival');
UPDATE artist SET name = 'CCR'
    WHERE name = 'Creedence Clearwater Revival';
SELECT * FROM artist WHERE artistid = 76;

-- DONE!

--2.5 LIKE
--Task – Select all invoices with a billing address like “T%”

SELECT * FROM invoice WHERE billingaddress LIKE 'T%';

-- DONE!

--2.6 BETWEEN
--Task – Select all invoices that have a total between 15 and 50

SELECT * FROM invoice WHERE total BETWEEN 15 AND 50;

-- DONE!

--Task – Select all employees hired between 1st of June 2003 and 1st of March 2004

SELECT * FROM employee
    WHERE hiredate BETWEEN '01-JUN-03' AND '01-MAR-04';
    
-- DONE!

--2.7 DELETE
--Task – Delete a record in Customer table where the name is Robert Walter (There may be constraints that rely on this, find out how to resolve them).
--

SELECT * FROM customer;
ALTER TABLE customer DISABLE CONSTRAINT PK_Customer CASCADE;
DELETE FROM customer WHERE firstname = 'Robert' AND lastname = 'Walter';
SELECT * FROM customer;

-- DONE!

--3.0 SQL Functions
--In this section you will be using the Oracle system functions, as well as your own functions, to perform various actions against the database
--3.1 System Defined Functions
--Task – Use a function that returns the current time.

SELECT TO_CHAR
    (SYSDATE, 'mm-dd-yyyy hh24:mi:ss') "NOW"
    FROM DUAL;
    
-- Close. Revisit later.

--Task – Use a function that returns the length of a mediatype from the mediatype table

SELECT LENGTH(name) FROM mediatype WHERE mediatypeid = 3;

-- DONE!

--3.2 System Defined Aggregate Functions
--Task – Use a function that returns the average total of all invoices

SELECT AVG(total) FROM invoice;

-- DONE!

--Task – Use a function that returns the most expensive track

SELECT MAX(unitprice) FROM track;

-- DONE!

--7.0 JOINS
--In this section you will be working with combing various tables through the use of joins. You will work with outer, inner, right, left, cross, and self joins.
--7.1 INNER
--Task – Create an inner join that joins customers and orders and specifies the name of the customer and the invoiceId.

SELECT * FROM customer;
SELECT * FROM invoice;

SELECT invoice.invoiceid AS invoiceid, customer.firstname AS firstname, customer.lastname AS lastname FROM invoice
    INNER JOIN (customer) USING (customerid);
    
-- DONE!

--7.2 OUTER
--Task – Create an outer join that joins the customer and invoice table, specifying the CustomerId, firstname, lastname, invoiceId, and total.

SELECT customer.customerid as customerid, customer.firstname AS firstname, customer.lastname AS lastname,
    invoice.invoiceid AS invoiceid, invoice.total AS total FROM invoice
    FULL JOIN (customer) ON (customer.customerid = invoice.customerid);
    
-- DONE!

--7.3 RIGHT
--Task – Create a right join that joins album and artist specifying artist name and title.

SELECT * FROM album;
SELECT * FROM artist;

SELECT artist.name AS name, album.title AS title FROM album RIGHT JOIN (artist) USING(artistid);

-- DONE!

--7.4 CROSS
--Task – Create a cross join that joins album and artist and sorts by artist name in ascending order.

SELECT * FROM album
    CROSS JOIN (artist)
        ORDER BY (artist.name);
        
-- Silly, but valid. DONE!

--7.5 SELF
--Task – Perform a self-join on the employee table, joining on the reportsto column.
