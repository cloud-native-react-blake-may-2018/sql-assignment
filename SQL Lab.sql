--1.0	Setting up Oracle Chinook
--In this section you will begin the process of working with the Oracle Chinook database
--Task – Open the Chinook_Oracle.sql file and execute the scripts within.
--2.0 SQL Queries
--In this section you will be performing various queries against the Oracle Chinook database.
--2.1 SELECT
--Task – Select all records from the Employee table.
    SELECT * FROM employee;
--Task – Select all records from the Employee table where last name is King.
    SELECT * FROM employee WHERE lastname like 'King';
--Task – Select all records from the Employee table where first name is Andrew and REPORTSTO is NULL.
    SELECT * FROM  employee WHERE firstname LIKE 'Andrew' AND reportsto IS NULL;
--2.2 ORDER BY
--Task – Select all albums in Album table and sort result set in descending order by title.
    SELECT * FROM album ORDER BY title DESC;
--Task – Select first name from Customer and sort result set in ascending order by city
    SELECT firstname FROM customer ORDER BY city ASC;
--2.3 INSERT INTO
--Task – Insert two new records into Genre table
    INSERT INTO genre (genreid, name)
        VALUES (26, 'Cool new genre');
    INSERT INTO genre (genreid, name)
        VALUES (27, 'Super cool new genre');
--Task – Insert two new records into Employee table
Select * from employee;
    INSERT INTO employee (employeeid, lastname, firstname, title, reportsto, birthdate, hiredate, address, city, state,country, postalcode, phone, fax, email)
        VALUES (9, 'Cross', 'Shawn', 'Guy that ', 5, TO_DATE('12-APR-89', 'DD-MON-RR'), TO_DATE('9-OCT-50','DD-MON-RR'), '25095 E Bolton Rd', 'Veneta', 'OR', 'USA', '97448', '+1 (541) 359-5880)', '(541)', 'smcross16@gmail.com'); 
    INSERT INTO employee (employeeid, lastname, firstname, title, reportsto, birthdate, hiredate, address, city, state,country, postalcode, phone, fax, email)
        VALUES (10, 'Cross', 'Jim', 'Guy that numero dos', 5, TO_DATE('12-APR-89', 'DD-MON-RR'), TO_DATE('9-OCT-50','DD-MON-RR'), '25095 E Bolton Rd', 'Veneta', 'OR', 'USA', '97448', '+1 (541) 359-5880)', '(541)', 'smcross16@gmail.com');
--Task – Insert two new records into Customer table
select * from customer;
    INSERT INTO customer (customerid, firstname, lastname, company, address, city, state, country, postalcode, phone, fax, email, supportrepid)
        VALUES (60, 'Jim', 'Jam', 'The Best Company', '123 A St', 'Eugene', 'OR', 'United States', '97402', '+1 541 373 7777', null, 'anemail@anemail.com', 4);
    INSERT INTO customer (customerid, firstname, lastname, company, address, city, state, country, postalcode, phone, fax, email, supportrepid)
        VALUES (61, 'Jim', 'Jammin', 'The Worst Company', '453 A St', 'Eugene', 'OR', 'United States', '97402', '+1 541 373 7777', null, 'anemail@anemail.com', 2);
--2.4 UPDATE
--Task – Update Aaron Mitchell in Customer table to Robert Walter
    UPDATE customer 
    SET firstname = 'Robert', lastname = 'Walter'
    WHERE firstname = 'Aaron' AND lastname = 'Mitchell';
--Task – Update name of artist in the Artist table “Creedence Clearwater Revival” to “CCR”
select * From artist;
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
    WHERE total BETWEEN 15 AND 50;
--Task – Select all employees hired between 1st of June 2003 and 1st of March 2004
    SELECT * FROM employee
    WHERE hiredate BETWEEN TO_DATE('01-JUN-03', 'DD-MON-RR') AND TO_DATE('01-MAR-04', 'DD-MON-RR');
--2.7 DELETE
--Task – Delete a record in Customer table where the name is Robert Walter (There may be constraints that rely on this, find out how to resolve them).
    DELETE FROM invoice 
    WHERE customerid = 
        (SELECT customerid FROM customer 
         WHERE firstname = 'Robert' AND lastname = 'Walter');
        
    
    DELETE FROM customer 
    WHERE firstname = 'Robert' AND lastname = 'Walter';
--
--3.0	SQL Functions
--In this section you will be using the Oracle system functions, as well as your own functions, to perform various actions against the database
--3.1 System Defined Functions
--Task – Use a function that returns the current time.
--Task – Use a function that returns the length of a mediatype from the mediatype table
--3.2 System Defined Aggregate Functions
--Task – Use a function that returns the average total of all invoices
--Task – Use a function that returns the most expensive track
--7.0 JOINS
--In this section you will be working with combing various tables through the use of joins. You will work with outer, inner, right, left, cross, and self joins.
--7.1 INNER
--Task – Create an inner join that joins customers and orders and specifies the name of the customer and the invoiceId.
--7.2 OUTER
--Task – Create an outer join that joins the customer and invoice table, specifying the CustomerId, firstname, lastname, invoiceId, and total.
--7.3 RIGHT
--Task – Create a right join that joins album and artist specifying artist name and title.
--7.4 CROSS
--Task – Create a cross join that joins album and artist and sorts by artist name in ascending order.
--7.5 SELF
--Task – Perform a self-join on the employee table, joining on the reportsto column.
--
