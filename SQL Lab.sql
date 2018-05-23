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
WHERE lastname ='King';
--Task – Select all records from the Employee table where first name is Andrew and REPORTSTO is NULL.
SELECT * FROM employee
WHERE firstname ='Andrew' AND reportsto IS NULL;
--2.2 ORDER BY
--Task – Select all albums in Album table and sort result set in descending order by title.
select * from album 
order by title desc;
--Task – Select first name from Customer and sort result set in ascending order by city
select firstname from customer
order by city asc;
--2.3 INSERT INTO
--Task – Insert two new records into Genre table
insert into genre(genreid,name)
values(26,'christian music');
insert into genre(genreid,name)
values(27,'punk rock');
--Task – Insert two new records into Employee table
insert into employee(employeeid,lastname,firstname,title,reportsto,birthdate,hiredate,address,city,state,country,postalcode,phone,fax,email)
values(9,'morris','dean','IT Staff',6,TO_DATE('09-JUN-1990','DD-MM-RR'),TO_DATE('07-AUG-10', 'DD-MON-RR'),null,null,null,null,null,null,null,null);

insert into employee(employeeid,lastname,firstname,title,reportsto,birthdate,hiredate,address,city,state,country,postalcode,phone,fax,email)
values(10,'mires','bob','IT Staff',6,TO_DATE('08-JUL-1990','DD-MM-RR'),TO_DATE('05-AUG-10', 'DD-MON-RR'),null,null,null,null,null,null,null,null);
--Task – Insert two new records into Customer table
insert into customer(customerid,firstname,lastname,company,address,city,state,country,postalcode,phone,fax,email,supportrepid)
values(60,'bino','philip',null,null,null,null,null,null,null,null,'bp145@yahoo.com',null);
insert into customer(customerid,firstname,lastname,company,address,city,state,country,postalcode,phone,fax,email,supportrepid)
values(61,'gary','olman',null,null,null,null,null,null,null,null,'gary1@yahoo.com',null);
--2.4 UPDATE
--Task – Update Aaron Mitchell in Customer table to Robert Walter
UPDATE customer 
SET firstname = 'Robert', lastname='Walter'
WHERE customerid=32;
--Task – Update name of artist in the Artist table “Creedence Clearwater Revival” to “CCR”
UPDATE artist
SET name = 'CCR'
WHERE artistid=76;
--2.5 LIKE
--Task – Select all invoices with a billing address like “T%”
select * from invoice
where billingaddress like 'T%';
--2.6 BETWEEN
--Task – Select all invoices that have a total between 15 and 50
select * from invoice
where total between 15 and 50;
--Task – Select all employees hired between 1st of June 2003 and 1st of March 2004
select * from employee
where hiredate between '01-JUN-03' and '01-MAR-04';
--2.7 DELETE
--Task – Delete a record in Customer table where the name is Robert Walter (There may be constraints that rely on this, find out how to resolve them).

alter table customer 
disable constraint PK_Customer cascade;

delete from customer
where firstname='Robert' and firstname='Walter';
--
--3.0	SQL Functions
--In this section you will be using the Oracle system functions, as well as your own functions, to perform various actions against the database
--3.1 System Defined Functions
--Task – Use a function that returns the current time.
select to_char(localtimestamp,'yyyy-mm-dd hh-mm') from DUAL;
--Task – Use a function that returns the length of a mediatype from the mediatype table
--3.2 System Defined Aggregate Functions
select * from mediatype
where  length(name) = 40;
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
