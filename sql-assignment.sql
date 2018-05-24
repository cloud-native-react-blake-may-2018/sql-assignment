--
--   SQL Lab
--
--1.0	Setting up Oracle Chinook
--In this section you will begin the process of working with the Oracle Chinook database
--Task – Open the Chinook_Oracle.sql file and execute the scripts within.
--2.0 SQL Queries
--In this section you will be performing various queries against the Oracle Chinook database.
--2.1 SELECT
--Task – Select all records from the Employee table.
select *  FROM Employee;

--Task – Select all records from the Employee table where last name is King.

select * FROM Employee WHERE lastname = 'King';

--Task – Select all records from the Employee table where first name is Andrew and REPORTSTO is NULL.

select * FROM Employee WHERE firstname = 'Andrew' AND  REPORTSTO IS NULL;


--2.2 ORDER BY
--Task – Select all albums in Album table and sort result set in descending order by title.
select * FROM Album ORDER BY title DESC ;

--Task – Select first name from Customer and sort result set in ascending order by city

select firstname FROM customer ORDER BY city;

--2.3 INSERT INTO
--Task – Insert two new records into Genre table

select * FROM Genre;

INSERT INTO Genre VALUES ( 26,'Reggaeton');
INSERT INTO Genre VALUES ( 27,'Lambada');


 
--Task – Insert two new records into Employee table

select * FROM Employee;

INSERT INTO Employee VALUES (9,'Figueroa','Laura','Developer',6,'19-SEP-47','01-MAY-02','Culebra Rd','San Antonio','TX','United States',78251,2105558888,8855555555,'jane@chinookcorp.com');
INSERT INTO Employee VALUES (10,'Tyson','Bob','IT Staff',2,'15-NOV-87','01-MAY-02','Toplo Rd','San Antonio','TX','United States',78251,7775558888,8855555555,'babiejesus@chinookcorp.com');
--Task – Insert two new records into Customer tableke
select * FROM customer;
INSERT INTO customer VALUES (60,'Derrik','Rose','Nike','Celsiusg.9,Stockholm','Metro City','California','United States',11230,2225558888,NULL,'enrique_munoz@yahoo.es',5);
INSERT INTO customer VALUES (61,'Michael','Jordan','Jordan LLC','Bay St.9,Stockholm','Bulls City','Chicago','United States',585848,856525695,NULL,'Champio6times@Jordan.es',NULL);

--2.4 UPDATE
--Task – Update Aaron Mitchell in Customer table to Robert Walter

select * FROM Customer;


UPDATE Customer 
SET firstname='Robert',lastname='Walter' WHERE firstname = 'Aaron' AND lastname = 'Mitchell';

--Task – Update name of artist in the Artist table “Creedence Clearwater Revival” to “CCR”
--select * FROM Artist;
--select * FROM Artist WHERE name LIKE '%Creedence%';
--select * FROM Artist WHERE artistid = 76;

Update Artist
    SET name='CCR' WHERE name ='Creedence Clearwater Revival';

--2.5 LIKE
--Task – Select all invoices with a billing address like “T%”

select * FROM invoice;
select * FROM invoice WHERE billingaddress LIKE 'T%';


--2.6 BETWEEN
--Task – Select all invoices that have a total between 15 and 50

select * FROM invoice
    WHERE total BETWEEN 15 and 20 ;
    
--Task – Select all employees hired between 1st of June 2003 and 1st of March 2004


select * FROM employee 
    WHERE hiredate BETWEEN '01-JUN-2003' AND '01-MAR-2004';

--2.7 DELETE
--Task – Delete a record in Customer table where the name is Robert Walter (There may be constraints that rely on this, find out how to resolve them).
--


ALTER TABLE customer
DISABLE CONSTRAINT PK_CUSTOMER CASCADE;

DELETE FROM customer
WHERE firstname='Robert' AND lastname='Walter';

select * FROM customer;

--3.0	SQL Functions
--In this section you will be using the Oracle system functions, as well as your own functions, to perform various actions against the database
--3.1 System Defined Functions
--Task – Use a function that returns the current time.

select to_char(sysdate,'HH12:MI:SS') from dual;



--Task – Use a function that returns the length of a mediatype from the mediatype table

 
SELECT  name, LENGTH(name) FROM mediatype ;
SELECT name ,LENGTh(name) FROM mediatype WHERE name= 'Protected MPEG-4 video file';

--3.2 System Defined Aggregate Functions
--Task – Use a function that returns the average total of all invoices

Select AVG(Total) FROM invoice;



--Task – Use a function that returns the most expensive track

--select * from track;

select MAX(unitprice)from track;
--7.0 JOINS
--In this section you will be working with combing various tables through the use of joins. You will work with outer, inner, right, left, cross, and self joins.

--7.1 INNER
--Task – Create an inner join that joins customers and orders and specifies the name of the customer and the invoiceId.

select customer.firstname , invoice.invoiceid from customer 
    INNER JOIN invoice
        ON customer.customerid = invoice.customerid;



--7.2 OUTER
--Task – Create an outer join that joins the customer and invoice table, specifying the CustomerId, firstname, lastname, invoiceId, and total.

select customer.customerid ,customer.firstname ,customer.lastname , invoice.invoiceid, invoice.total from customer 
    FULL OUTER JOIN invoice
        ON customer.customerid = invoice.customerid;
--7.3 RIGHT
--Task – Create a right join that joins album and artist specifying artist name and title.
select artist.name, album.title from album
    RIGHT OUTER JOIN artist
      USING( ARTISTID);
--7.4 CROSS
--Task – Create a cross join that joins album and artist and sorts by artist name in ascending order.

select artist.name  from artist ,album
    GROUP BY artist.name  ;
    
      
      
      
--7.5 SELF
--Task – Perform a self-join on the employee table, joining on the reportsto column.
--
select * from employee empl 
    INNER JOIN employee mngr
    ON(empl.employeeid =mngr.reportsto);
    
 