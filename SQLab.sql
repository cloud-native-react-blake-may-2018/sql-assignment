--When done can git push --set-upstream origin Ruthanna
--SQL Lab
--
--1.0 Setting up Oracle Chinook
--In this section you will begin the process of working with the Oracle Chinook database
--Task – Open the Chinook_Oracle.sql file and execute the scripts within.
--2.0 SQL Queries
--In this section you will be performing various queries against the Oracle Chinook database.
--2.1 SELECT
--Task – Select all records from the Employee table.
SELECT * FROM EMPLOYEE; 
--Task – Select all records from the Employee table where last name is King.
SELECT * FROM EMPLOYEE WHERE LASTNAME = 'King';
--Task – Select all records from the Employee table where first name is Andrew and REPORTSTO is NULL.
SELECT * FROM EMPLOYEE WHERE FIRSTNAME = 'Andrew';
--2.2 ORDER BY
--Task – Select all albums in Album table and sort result set in descending order by title.
SELECT * FROM ALBUM ORDER BY TITLE DESC; 
--Task – Select first name from Customer and sort result set in ascending order by city
SELECT FIRSTNAME FROM CUSTOMER ORDER BY CITY ASC; 
--2.3 INSERT INTO
--Task – Insert two new records into Genre table
INSERT INTO GENRE (GENREID, NAME) VALUES(26, 'Christian Contemporary');
INSERT INTO GENRE (GENREID, NAME) VALUES(27, 'Gospel');
COMMIT; 
--Task – Insert two new records into Employee table
INSERT INTO EMPLOYEE 
(EMPLOYEEID, LASTNAME, FIRSTNAME, TITLE, REPORTSTO, BIRTHDATE, HIREDATE, ADDRESS, CITY, STATE, COUNTRY, POSTALCODE, PHONE, FAX, EMAIL)
VALUES(9, 'Jasper', 'John', 'Mascot', 2, TO_DATE('15-MAR-44', 'DD-MON-RR'), TO_DATE('22-MAY-18', 'DD-MON-RR'), '63 Northwest Power', 'Centrally', 'AB', 'Canada', 'TMG 365', '1 (365) 945-7275', '1 (365) 945-7275', 'jasper@chinookcorp.com'); 
INSERT INTO EMPLOYEE 
(EMPLOYEEID, LASTNAME, FIRSTNAME, TITLE, REPORTSTO, BIRTHDATE, HIREDATE, ADDRESS, CITY, STATE, COUNTRY, POSTALCODE, PHONE, FAX, EMAIL)
VALUES(10, 'Chaplin', 'Charlie', 'Advertiser', 1, TO_DATE('06-JUN-94', 'DD-MON-RR'), TO_DATE('22-MAY-18', 'DD-MON-RR'), '51 Emergency Street', 'New York', 'AB', 'Canada', 'T0Y WLB', '1 (365) 867-5309', '1 (365) 867-5309', 'charlie@chinookcorp.com');
commit; 
--Task – Insert two new records into Customer table
INSERT INTO CUSTOMER 
(CUSTOMERID, LASTNAME, FIRSTNAME, COMPANY, ADDRESS, CITY, STATE, COUNTRY, POSTALCODE, PHONE, FAX, EMAIL, SUPPORTREPID)
VALUES(60, 'Houston', 'Sam', 'Republic of Texas', '48 Mexican War Ave', 'Houston', 'TX', 'USA', '76520', '1 (405) 312-2840', '1 (405) 312-2840', 'sam@repofTexas.tx', 5);
INSERT INTO CUSTOMER 
(CUSTOMERID, LASTNAME, FIRSTNAME, COMPANY, ADDRESS, CITY, STATE, COUNTRY, POSTALCODE, PHONE, FAX, EMAIL, SUPPORTREPID)
VALUES(61, 'Crockett', 'Davy', 'US Army', '1838 Raccoon Road', 'Knoxboro', 'TN', 'USA', '38543', '1 (658) 921-8843', '1 (658) 921-8843', 'ColonelCrockett@riproaring.com', 4);
commit; 
 
--2.4 UPDATE
--Task – Update Aaron Mitchell in Customer table to Robert Walter
UPDATE CUSTOMER 
 SET FIRSTNAME = 'Robert', LASTNAME = 'Walter'
 WHERE Firstname = 'Aaron' AND LASTNAME = 'Mitchell'; 
COMMIT; 

--Task – Update name of artist in the Artist table “Creedence Clearwater Revival” to “CCR”
UPDATE ARTIST 
    SET NAME = 'CCR' WHERE NAME = 'Creedence Clearwater Revival';
COMMIT; 
--2.5 LIKE
--Task – Select all invoices with a billing address like “T%”
    SELECT * FROM INVOICE WHERE BILLINGADDRESS LIKE 'T%'; 
--2.6 BETWEEN
--Task – Select all invoices that have a total between 15 and 50
SELECT * FROM INVOICE 
    WHERE TOTAL BETWEEN 15 AND 50; 
--Task – Select all employees hired between 1st of June 2003 and 1st of March 2004
SELECT * FROM EMPLOYEE WHERE HIREDATE BETWEEN TO_DATE('01-JUN-03', 'DD-MON-RR') AND TO_DATE('01-MAR-04', 'DD-MON-RR');
--2.7 DELETE
--Task – Delete a record in Customer table where the name is Robert Walter (There may be constraints that rely on this, find out how to resolve them).
ALTER TABLE CUSTOMER DISABLE CONSTRAINT PK_CUSTOMER CASCADE;  
DELETE FROM CUSTOMER WHERE FIRSTNAME = 'Robert' AND LASTNAME = 'Walter'; 
commit;
--3.0 SQL Functions
--In this section you will be using the Oracle system functions, as well as your own functions, to perform various actions against the database
--3.1 System Defined Functions
--Task – Use a function that returns the current time.
SELECT TO_CHAR(LOCALTIMESTAMP, 'HH:MI:SS') FROM DUAL; 
 --Task – Use a function that returns the length of a mediatype from the mediatype table
SELECT MEDIATYPEID, LENGTH(NAME) FROM MEDIATYPE; 
--3.2 System Defined Aggregate Functions
--Task – Use a function that returns the average total of all invoices
SELECT AVG(TOTAL) FROM INVOICE; 
--Task – Use a function that returns the most expensive track
SELECT * FROM TRACK WHERE UNITPRICE =  
    (SELECT MAX(UNITPRICE) FROM TRACK); 
--7.0 JOINS
--In this section you will be working with combing various tables through the use of joins. You will work with outer, inner, right, left, cross, and self joins.
--7.1 INNER
--Task – Create an inner join that joins customers and orders and specifies the name of the customer and the invoiceId.
SELECT CUS.FIRSTNAME, CUS.LASTNAME, INVOICE.INVOICEID FROM CUSTOMER CUS INNER JOIN INVOICE USING(CUSTOMERID);
--7.2 OUTER
--Task – Create an outer join that joins the customer and invoice table, specifying the CustomerId, firstname, lastname, invoiceId, and total.
SELECT CUS.CUSTOMERID, CUS.FIRSTNAME, CUS.LASTNAME, INVOICE.INVOICEID, INVOICE.TOTAL FROM CUSTOMER CUS FULL JOIN INVOICE ON(CUS.CUSTOMERID = INVOICE.CUSTOMERID);
--7.3 RIGHT
--Task – Create a right join that joins album and artist specifying artist name and title.
select ARTIST.NAME, ALBUM.TITLE from ALBUM RIGHT JOIN artist USING(ARTISTID); 
--7.4 CROSS
--Task – Create a cross join that joins album and artist and sorts by artist name in ascending order.
SELECT * FROM ALBUM CROSS JOIN ARTIST ORDER BY ARTIST.NAME ASC; 
--7.5 SELF
--Task – Perform a self-join on the employee table, joining on the reportsto column.
select * from EMPLOYEE EMP LEFT JOIN EMPLOYEE MAN ON(EMP.REPORTSTO = MAN.EMPLOYEEID); 
