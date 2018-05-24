--1.0	Setting up Oracle Chinook
--In this section you will begin the process of working with the Oracle Chinook database
--Task – Open the Chinook_Oracle.sql file and execute the scripts within.
--2.0 SQL Queries
--In this section you will be performing various queries against the Oracle Chinook database.
--2.1 SELECT
--Task – Select all records from the Employee table.
SELECT * FROM employee;
--Task – Select all records from the Employee table where last name is King.
SELECT * FROM employee
    WHERE lastname = 'King';
--Task – Select all records from the Employee table where first name is Andrew and REPORTSTO is NULL.
SELECT * FROM employee 
    WHERE firstname = 'Andrew' 
    AND reportsto IS NULL;
--2.2 ORDER BY
--Task – Select all albums in Album table and sort result set in descending order by title.
SELECT * FROM album 
    ORDER BY title DESC;
--Task – Select first name from Customer and sort result set in ascending order by city
SELECT firstname FROM customer
    ORDER BY city ASC;
--2.3 INSERT INTO
--Task – Insert two new records into Genre table
--SELECT * FROM genre;
INSERT INTO genre (GENREID, NAME) VALUES (26, 'Chillstep');
INSERT INTO genre (genreid, name) VALUES (27, 'Folk');
--Task – Insert two new records into Employee table
--SELECT * FROM employee;
INSERT INTO Employee (EmployeeId, LastName, FirstName, Title, ReportsTo, BirthDate, HireDate, Address, City, State, Country, PostalCode, Phone, Fax, Email) 
    VALUES (9, 'Stormwind', 'Tiberius', 'Sorcerer', 1, TO_DATE('1983-5-9 00:00:00','yyyy-mm-dd hh24:mi:ss'), TO_DATE('2002-10-17 00:00:00','yyyy-mm-dd hh24:mi:ss'), '73 Stonewalk Drive', 'Draconia', 'Taldorei', 'Exandria', 'T4G 1Y7', '1 (780) 836-9988', '1 (780) 836-9544', 'tiberius@chinookcorp.com');
INSERT INTO Employee (EmployeeId, LastName, FirstName, Title, ReportsTo, BirthDate, HireDate, Address, City, State, Country, PostalCode, Phone, Fax, Email) 
    VALUES (10, 'Of the Ashari', 'Keyleth', 'Druid Leader', 1, TO_DATE('1986-10-13 00:00:00','yyyy-mm-dd hh24:mi:ss'), TO_DATE('2002-10-17 00:00:00','yyyy-mm-dd hh24:mi:ss'), '1 Pale Tree', 'Zephra', 'Taldorei', 'Exandria', 'T5H 2Y8', '1 (780) 836-9989', '1 (780) 836-9545', 'keyleth@chinookcorp.com');
--Task – Insert two new records into Customer table
--2.4 UPDATE
--Task – Update Aaron Mitchell in Customer table to Robert Walter
--SELECT * FROM customer;
UPDATE customer
    SET firstname = 'Robert', lastname = 'Walter'
    WHERE firstname = 'Aaron' AND lastname = 'Mitchell';
--Task – Update name of artist in the Artist table “Creedence Clearwater Revival” to “CCR”
--SELECT * FROM artist;
UPDATE artist
    SET name = 'CCR'
    WHERE name = 'Creedence Clearwater Revival';
--2.5 LIKE
--Task – Select all invoices with a billing address like “T%”
SELECT * FROM invoice 
    WHERE billingaddress LIKE 'T%';
--2.6 BETWEEN
--Task – Select all invoices that have a total between 15 and 50
SELECT * FROM invoice 
    WHERE total BETWEEN 15 AND 30;
--Task – Select all employees hired between 1st of June 2003 and 1st of March 2004
SELECT * FROM employee
    WHERE hiredate BETWEEN TO_DATE('2003-06-01 00:00:00','yyyy-mm-dd hh24:mi:ss') 
    AND TO_DATE('2004-03-01 00:00:00','yyyy-mm-dd hh24:mi:ss');
--2.7 DELETE
--Task – Delete a record in Customer table where the name is Robert Walter (There may be constraints that rely on this, find out how to resolve them).
    --Delete rows in dependent tables first
ALTER TABLE customer
    DISABLE CONSTRAINT pk_customer CASCADE;
DELETE FROM customer
    WHERE firstname = 'Robert' AND lastname = 'Walter';
/*ALTER TABLE customer
    ADD CONSTRAINT pk_customer
        PRIMARY KEY (customerid);*/
--
--3.0	SQL Functions
--In this section you will be using the Oracle system functions, as well as your own functions, to perform various actions against the database
--3.1 System Defined Functions
--Task – Use a function that returns the current time.
SELECT TO_CHAR
    (LOCALTIMESTAMP, 'HH:MI:SS')
    FROM DUAL;
--Task – Use a function that returns the length of a mediatype from the mediatype table
--SELECT * FROM mediatype;
SELECT LENGTH(name) FROM mediatype;
--3.2 System Defined Aggregate Functions32
--Task – Use a function that returns the average total of all invoices
SELECT AVG(total) FROM invoice;
--Task – Use a function that returns the most expensive track
--7.0 JOINS
--In this section you will be working with combing various tables through the use of joins. You will work with outer, inner, right, left, cross, and self joins.
--7.1 INNER
--Task – Create an inner join that joins customers and orders and specifies the name of the customer and the invoiceId.
Select Customer.firstname, Customer.lastname, Invoice.invoiceid
    FROM Invoice
    INNER JOIN Customer 
    USING (customerid);
--7.2 OUTER
--Task – Create an outer join that joins the customer and invoice table, specifying the CustomerId, firstname, lastname, invoiceId, and total.
SELECT Customer.customerid, Customer.firstname, Customer.lastname, Invoice.invoiceid, Invoice.total
    FROM Customer
    FULL OUTER JOIN Invoice 
    ON Customer.customerid = Invoice.customerid;
--7.3 RIGHT
--Task – Create a right join that joins album and artist specifying artist name and title.
SELECT Artist.name, Album.title
    FROM Album
    RIGHT JOIN Artist 
    USING (artistid)
    ORDER BY Artist.name;
--7.4 CROSS
--Task – Create a cross join that joins album and artist and sorts by artist name in ascending order.
SELECT * FROM Album CROSS JOIN Artist
    ORDER BY Artist.name ASC;
--7.5 SELF
--Task – Perform a self-join on the employee table, joining on the reportsto column.
SELECT * FROM employee e1
    INNER JOIN employee e2
    ON e1.reportsto = e2.employeeid;

commit;