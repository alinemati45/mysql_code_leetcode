/*
Table: Sessions
+---------------------+---------+
| Column Name         | Type    |
+---------------------+---------+
| session_id          | int     |
| duration            | int     |
+---------------------+---------+
session_id is the primary key for this table.
duration is the time in seconds that a user has visited the
application.

You want to know how long a user visits your application. 
You decided to create 
bins of "[0-5>", "[5-10>", "[10-15>" and "15 minutes or more" 
and count the 
number of sessions on it.
Write an SQL query to report the (bin, total) in any order.
The query result format is in the following example.

Sessions table:

+-------------+---------------+
| session_id  | duration      |
+-------------+---------------+
| 1           | 30            |
| 2           | 199           |
| 3           | 299           |
| 4           | 580           |
| 5           | 1000          |
+-------------+---------------+

Result table:

+--------------+--------------+
| bin          | total        |
+--------------+--------------+
| [0-5>        | 3            |
| [5-10>       | 1            |
| [10-15>      | 0            |
| 15 or more   | 1            |
+--------------+--------------+

For session_id 1, 2 and 3 have a duration greater or equal 
than 0 minutes and  less than 5 minutes.
For session_id 4 has a duration greater or equal than
5 minutes and less than 10 minutes.

There are no session with a duration greater or equial 
than 10 minutes and less than 15 minutes.
For session_id 5 has a duration greater or equal than 15 minutes.


##################################################################

The SQL UNION Operator: 

The UNION operator is used to combine the result-set of two or 
more SELECT statements.

- Every SELECT statement within UNION must have the same number 
of columns

- The columns must also have similar data types

- The columns in every SELECT statement must also be in the same order


UNION Syntax: 

SELECT column_name(s) FROM table1
UNION
SELECT column_name(s) FROM table2;


UNION ALL Syntax:

The UNION operator selects only distinct values by default. 
To allow duplicate  values, use UNION ALL:

SELECT column_name(s) FROM table1
UNION ALL
SELECT column_name(s) FROM table2;

#########################
##################################################################

The SQL CASE Expression: 
The CASE expression goes through conditions and returns a value 
when the first 
condition is met (like an if-then-else statement). So, 
once a condition is true,
it will stop reading and return the result. If no conditions are
true, it  returns the value in the ELSE clause.

If there is no ELSE part and no conditions are true, it returns NULL.

CASE Syntax
CASE
    WHEN condition1 THEN result1
    WHEN condition2 THEN result2
    WHEN conditionN THEN resultN
    ELSE result
END;
*/

## Solution

USE SQL_LEEDCODE;

DROP TABLE IF EXISTS SESSIONS;

CREATE TABLE SESSIONS (
    SESSION_ID INT,
    DURATION INT,
    PRIMARY KEY (SESSION_ID)
);
 
INSERT INTO SESSIONS
VALUES (1 , 30),
(2 , 199),
(3 , 299),
(4 ,580) , (5 , 1000);


SELECT 
    *
FROM
    SESSIONS;
##################################################################
##                            ANSWER                            ##
##################################################################

SELECT 
    '[0-5>' AS BIN, COUNT(1) AS TOTAL
FROM
    SESSIONS
WHERE
    DURATION >= 0 AND DURATION < 300 
UNION SELECT 
    '[5-10>' AS BIN, COUNT(1) AS TOTAL
FROM
    SESSIONS
WHERE
    DURATION >= 300 AND DURATION < 600 
UNION SELECT 
    '[10-15>' AS BIN, COUNT(1) AS TOTAL
FROM
    SESSIONS
WHERE
    DURATION >= 600 AND DURATION < 900 
UNION SELECT 
    '15 OR MORE' AS BIN, COUNT(1) AS TOTAL
FROM
    SESSIONS
WHERE
    DURATION >= 900;




