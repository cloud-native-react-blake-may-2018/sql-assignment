--SQL Lab
--
--1.0	Setting up Oracle Chinook
--In this section you will begin the process of working with the Oracle Chinook database
--Task – Open the Chinook_Oracle.sql file and execute the scripts within.
--2.0 SQL Queries
--In this section you will be performing various queries against the Oracle Chinook database.
--2.1 SELECT
--Task – Select all records from the Employee table.
select * from Employee;

--Task – Select all records from the Employee table where last name is King.
select * from Employee where lastname = 'King';

--Task – Select all records from the Employee table where first name is Andrew and REPORTSTO is NULL.
select * from Employee where firstname = 'Andrew' and reportsto is null;

--2.2 ORDER BY
--Task – Select all albums in Album table and sort result set in descending order by title.
select title from Album order by title desc;

--Task – Select first name from Customer and sort result set in ascending order by city
select title from Album order by title;


--2.3 INSERT INTO
--Task – Insert two new records into Genre table
insert into genre (name, genreid) values 
    ('Deep House', 26);

insert into genre (name, genreid) values 
    ('Chillwave', 27);


--Task – Insert two new records into Employee table
insert into employee (employeeid, firstname, lastname, birthdate, email, phone, fax, address, city, state, country, postalcode, title, hiredate, reportsto) 
    values (9, 'Max', 'Tegmark', '05-MAY-67', 'tegmark@mit.edu', '(617) 452-4627', '(617) 452-4627', '77 Massachusetts Ave', 'Cambridge', 'MA', 'United States', 02139, 'Professor', '04-OCT-05', 3);

insert into employee (employeeid, firstname, lastname, birthdate, email, phone, fax, address, city, state, country, postalcode, title, hiredate, reportsto) 
    values (10, 'Neil', 'Tyson', '06-OCT-58', '@neiltyson', '+1 (212) 769-5913', '+1 (212) 769-5007', 'Central Park West at 79th Street', 'New York', 'NY', 'United States', 10024, 'Astrophysicist', '04-OCT-05', 1);

--Task – Insert two new records into Customer table
insert into customer (firstname, lastname, company, email, phone, fax, address, postalcode, city, state, country, supportrepid, customerid) 
    values ('Frankie', 'Cosmos', 'Porches', 'frankiecosmos@gmail.com', '800-213-1412', '800-241-1232', '228 Park Ave', '10003', 'New York', 'NY', 'United States', 40, 120);

insert into customer (firstname, lastname, company, email, phone, fax, address, postalcode, city, state, country, supportrepid, customerid) 
    values ('Freddie', 'Mercury', 'Queen', 'freddiemercury@gmail.com', '234-123-3512', '234-652-1253', '431 Menlo Park', '43123', 'Palo Alto', 'CA', 'United States', 3, 75);


--2.4 UPDATE
--Task – Update Aaron Mitchell in Customer table to Robert Walter
update customer 
    set firstname = 'Robert', lastname = 'Walter' 
    where firstname = 'Aaron' and lastname = 'Mitchell';

--Task – Update name of artist in the Artist table “Creedence Clearwater Revival” to “CCR”
update artist
    set name = 'CCR'
    where name = 'Creedence Clearwater Revival';


--2.5 LIKE
--Task – Select all invoices with a billing address like “T%”
select * from invoice where billingaddress like 'T%';

--2.6 BETWEEN
--Task – Select all invoices that have a total between 15 and 50
select * from invoice where total between 15 and 50;

--Task – Select all employees hired between 1st of June 2003 and 1st of March 2004
select * from employee where hiredate between '01-JUN-03' and '01-MAR-04';

--2.7 DELETE
--Task – Delete a record in Customer table where the name is Robert Walter (There may be constraints that rely on this, find out how to resolve them).

-- find all constraints for a specific table
--select * from user_cons_columns where table_name = 'INVOICE';

-- disable a specific constraint for a specific table
--alter table invoice disable constraint fk_invoicecustomerid;

delete customer where firstname = 'Robert' and lastname = 'Walter';


--3.0	SQL Functions
--In this section you will be using the Oracle system functions, as well as your own functions, to perform various actions against the database
--3.1 System Defined Functions
--Task – Use a function that returns the current time.
select to_char(localtimestamp, 'hh:mi:ss am') as time from dual;

--Task – Use a function that returns the length of a mediatype from the mediatype table
select length(name) as length from mediatype;

--3.2 System Defined Aggregate Functions
--Task – Use a function that returns the average total of all invoices
select round(avg(total)) from invoice;

--Task – Use a function that returns the most expensive track
select max(unitprice) from track;


--7.0 JOINS
--In this section you will be working with combing various tables through the use of joins. You will work with outer, inner, right, left, cross, and self joins.
--7.1 INNER
--Task – Create an inner join that joins customers and orders and specifies the name of the customer and the invoiceId.
select customer.firstname, customer.lastname, invoice.invoiceid
from customer
inner join invoice 
on customer.customerid = invoice.invoiceid;


--7.2 OUTER
--Task – Create an outer join that joins the customer and invoice table, specifying the CustomerId, firstname, lastname, invoiceId, and total.
select customer.customerid, customer.firstname, customer.lastname, invoice.invoiceid, invoice.total
from customer
full outer join invoice
on customer.customerid = invoice.customerid;


--7.3 RIGHT
--Task – Create a right join that joins album and artist specifying artist name and title.
select album.title, artist.name
from album
right join artist
on artist.artistid = album.artistid;


--7.4 CROSS
--Task – Create a cross join that joins album and artist and sorts by artist name in ascending order.
select artist.name, album.title
from album
cross join artist;


--7.5 SELF
--Task – Perform a self-join on the employee table, joining on the reportsto column.
select e1.reportsto, e2.reportsto
from employee e1, employee e2
where e1.reportsto = e2.reportsto;


--select * from employee cross join customer
select * from employee
cross join customer;


