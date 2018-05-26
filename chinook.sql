select * from customer;

select * from genre; --FRO FINDING LIST OF GENRE COLUMN TO SEE GENRE ID

--SELECT UPPER(name) FROM track WHERE genreid = 7; --MAKES EVERYTHING TO UPPER CASE, SCALER FUNCTION(1 INPUT 1 OUTPUT)

--SELECT UPPER(name) FROM track WHERE LENGTH (name) > 25; -- OUTPUTS TRACKS WITH NAMES LONGER THAN 25 CHARACTERS

--SELECT COUNT(trackid) FROM track
    --WHERE LENGTH(name) > 25; --counts a total of tracks with name longer than 25
    
--SELECT COUNT(trackid), genreid FROM track
   -- WHERE LENGTH(name) > 25
    --GROUP BY genreid
   -- ORDER BY genreid;

SELECT COUNT(trackid), genreid FROM track
    WHERE LENGTH(name) > 25 --FILTERS BEFORE GROUPING WAS DONE THAT SPECIFIES GROUP OF TRACKS WITH NUMBER > 25 PER GENRE
    GROUP BY genreid        --GROUPS THEME TOGETHER BY GENREID
    HAVING COUNT(trackid) >= 50 --FILTERS AFTER GROUPING WAS DONE THAT SPECIFIES GROUP OF TRACKIDS WITH NUMBER >= 50 PER GENRE
    ORDER BY genreid; --ORDERS THEM INTO GROUP BY GENREID INCREASING ORDER
    
SELECT MAX(LENGTH(name)) FROM track; --FINDS VALUE OF TRACK WITH LONGEST NAME
SELECT name FROM track WHERE LENGTH(name) = 123; --OUTPUTS TRACK NAME WITH LONGEST NAME OF 123

--TO PUT QUERY AND SUBQUERY TOGETHER INTO ONE USE FORMAT LIKE THIS

SELECT name, LENGTH(name) FROM track
    WHERE LENGTH(name) = 
    (SELECT MAX(LENGTH(name))
    FROM track); --OUTPUTS BOTH QUERIES FROM ABOVE INTO ONE NESTED QUERY
    
    SELECT MIN(albumid) FROM track;
    SELECT * FROM track WHERE albumid = 1;

SELECT * FROM track WHERE albumid = 
    (SELECT MAX(LENGTH(name))
    FROM track);
    
SELECT * FROM invoice 
    WHERE billingstate = 'CA'; --TAKES ALL LIST OF TRACKS FROM CA
    
SELECT customerid FROM invoice 
    WHERE billingstate = 'CA'; --TAKES ALL TRACKS FROM INVOICE ABOVE AND JUST SHOWS CUSTOMERID
    
SELECT * FROM customer
    WHERE customerid IN (
    SELECT customerid FROM invoice 
    WHERE billingstate = 'CA');   --TAKES ALL NAMES OF CUSTOMER FROM THEIR CUSTOMERID FROM ABOVE QUERY
    
    
SELECT name FROM artist WHERE artistid = (
    SELECT artistid FROM album WHERE albumid = ( 
    SELECT albumid FROM track WHERE trackid = 53));
    
SELECT* FROM track WHERE trackid = 1;

SELECT * FROM artist;
SELECT * FROM track t FULL JOIN mediatype med 
ON (t.mediatypeid = med.mediatypeid)
WHERE t.mediatypeid != 1;

SELECT * FROM track t 
FULL JOIN playlisttrack 
USING (trackid) 
FULL JOIN playlist 
USING (playlistid);

    SELECT * FROM artist 
        FULL JOIN album 
        ORDER BY artist.name;
        
        SELECT * FROM employee CROSS JOIN customer;
        
CREATE OR REPLACE VIEW albums_with_artist_name AS 
    (SELECT albumid, title, name FROM artist INNER JOIN album on (artist.name = album.title));
    
    SELECT * FROM albums_with_artist_name;
    
    SELECT firstname FROM customer WHERE UPPER(firstname) LIKE '%L%'
    MINUS
    SELECT firstname FROM customer WHERE UPPER(firstname) LIKE '%O%';  --TAKES OUT NAME THAT MATCHES BOTH EX: LEONIE
    
    SELECT firstname FROM customer WHERE UPPER(firstname) LIKE '%L%'
    INTERSECT
    SELECT firstname FROM customer WHERE UPPER(firstname) LIKE '%O%';  --SHOWS NAME(S) THAT IS IN BOTH CIRCUMSTANCES
    
    SELECT firstname FROM customer WHERE UPPER(firstname) LIKE '%L%'
    UNION
    SELECT firstname FROM customer WHERE UPPER(firstname) LIKE '%O%';  --JOINS ALL NAMES WITH FIRSTNAME WITH L AND O IN THEM.

    

