
/*
Several friends at a cinema ticket office would like to reserve consecutive 
available seats.
Can you help to query all the consecutive available seats order by the seat_id 
using the following cinema table?


```sql

| seat_id | free |
|****************|
| 1       | 1    |
| 2       | 0    |
| 3       | 1    |
| 4       | 1    |
| 5       | 1    |

Your query should return the following result for the sample case above.

| seat_id |
|---------|
| 3       |
| 4       |
| 5       |

Note:
The seat_id is an auto increment int, and free is bool ('1' means 
free, and '0'
means occupied.).
Consecutive available seats are more than 2(inclusive) seats
consecutively 
available.








*/

## Solution


USE SQL_LEEDCODE;
DROP TABLE IF EXISTS CINEMA;
CREATE TABLE IF NOT EXISTS CINEMA (SEAT_ID INT PRIMARY KEY 
AUTO_INCREMENT, FREE BOOL);
TRUNCATE TABLE CINEMA;

INSERT INTO CINEMA (SEAT_ID, FREE) VALUES ('1', '1');
INSERT INTO CINEMA (SEAT_ID, FREE) VALUES ('2', '0');
INSERT INTO CINEMA (SEAT_ID, FREE) VALUES ('3', '1');
INSERT INTO CINEMA (SEAT_ID, FREE) VALUES ('4', '1');
INSERT INTO CINEMA (SEAT_ID, FREE) VALUES ('5', '1');
SELECT * FROM CINEMA;

##################################################################
##                            ANSWER                            ##
##################################################################
SELECT 
     *
FROM CINEMA A 
INNER JOIN CINEMA B 
ON ABS(A.SEAT_ID - B.SEAT_ID) = 1 
WHERE A.FREE = 1 AND B.FREE = 1 
ORDER BY A.SEAT_ID;

/*
Return the absolute value of a number:

SELECT Abs(-243.5) AS AbsNum; => 243.5
*/

SELECT 
     DISTINCT(A.SEAT_ID) 
FROM CINEMA A 
INNER JOIN CINEMA B 
ON ABS(A.SEAT_ID - B.SEAT_ID) = 1 
WHERE A.FREE = 1 AND B.FREE = 1 
ORDER BY A.SEAT_ID;