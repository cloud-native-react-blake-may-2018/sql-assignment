--2.1 SELECT
SELECT * FROM employee;
SELECT * FROM employee WHERE lastname = 'King';
SELECT * FROM employee WHERE firstname = 'Andrew' AND reportsto is null;
--2.2 ORDER BY
SELECT * FROM album ORDER BY title DESC;
SELECT firstname FROM customer ORDER BY city ASC;
--2.3 INSERT INTO
INSERT INTO genre (genreid, name) VALUES (26, 'JPop');
INSERT INTO genre (genreid, name) VALUES (27, 'KPop');
INSERT INTO employee (employeeid, lastname, firstname) VALUES (9, 'Fleegman', 'Guy');
INSERT INTO employee (employeeid, lastname, firstname) VALUES (10, 'Rogers', 'Keith');
INSERT INTO customer (customerid, firstname, lastname, email) VALUES (60, 'Buster', 'Buster', 'totally.valid@email.mail');
INSERT INTO customer (customerid, firstname, lastname, email) VALUES (61, 'Jim', 'Bob', 'totally.valid@email.mail');
--2.4 UPDATE
UPDATE customer SET firstname = 'Robert', lastname = 'Walter' WHERE firstname = 'Aaron' AND lastname = 'Mitchell';
UPDATE artist SET name = 'CCR' WHERE name = 'Creedence Clearwater Revival';
--2.5 LIKE
SELECT * FROM invoice WHERE billingaddress LIKE 'T%';
--2.6 BETWEEN
SELECT * FROM invoice WHERE total BETWEEN 15 AND 30;
SELECT * FROM employee WHERE hiredate BETWEEN TO_DATE('07/01/2003', 'MM/DD/YYYY') AND TO_DATE('03/01/2004', 'MM/DD/YYYY');
--2.7 DELETE
-- REVISIT THIS WHEN TIME IS AVAILABLE
ALTER TABLE invoice MODIFY (customerid NULL);
UPDATE invoice SET customerid = null WHERE customerid = (SELECT customerid from customer WHERE firstname = 'Robert' AND lastname = 'Walter');
DELETE FROM customer WHERE firstname = 'Robert' AND lastname = 'Walter';
--3.1 System Defined Functions
SELECT * FROM employee WHERE birthdate < CURRENT_TIMESTAMP(6);
SELECT LENGTH(name) FROM mediatype GROUP BY name;
--3.2 System Defind Aggregate Functions
SELECT AVG(total) FROM invoice;
SELECT * FROM track WHERE unitprice = (SELECT MAX(unitprice) FROM track);
--7.1 INNER JOIN
SELECT customer.firstname, customer.lastname, invoice.invoiceid FROM customer INNER JOIN invoice ON customer.customerid = invoice.customerid;
--7.2 OUTER JOIN
SELECT customer.customerid, customer.firstname, customer.lastname, invoice.invoiceid, invoice.total FROM customer FULL OUTER JOIN invoice ON customer.customerid = invoice.customerid;
--7.3 RIGHT JOIN
SELECT artist.name, album.title FROM album RIGHT JOIN artist ON album.artistid = artist.artistid;
--7.4 CROSS JOIN
SELECT * FROM album CROSS JOIN artist ORDER BY artist.name ASC;
--7.5 SELF JOIN
SELECT * FROM employee e1 LEFT JOIN employee e2 ON e1.employeeid = e2.reportsto;