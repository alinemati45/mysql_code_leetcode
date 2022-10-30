/*
Write an SQL query to find the ctr of each Ad.


Table: Ads

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| ad_id         | int     |
| user_id       | int     |
| action        | enum    |
+---------------+---------+
(ad_id, user_id) is the primary key for this table.

Each row of this table contains the ID of an Ad, the ID of a 
user and the action
taken by this user regarding this Ad.
##################################################################

The action column is an ENUM type of ('Clicked', 'Viewed', 'Ignored').
 

A company is running Ads and wants to calculate the performance of
each Ad.

Performance of the Ad is measured using Click-Through Rate (CTR) 
where:


Write an SQL query to find the ctr of each Ad.

Round ctr to 2 decimal points. Order the result table by ctr in
descending order
and by ad_id in ascending order in case of a tie.

The query result format is in the following example:

Ads table:
+-------+---------+---------+
| ad_id | user_id | action  |
+-------+---------+---------+
| 1     | 1       | Clicked |
| 2     | 2       | Clicked |
| 3     | 3       | Viewed  |
| 5     | 5       | Ignored |
| 1     | 7       | Ignored |
| 2     | 7       | Viewed  |
| 3     | 5       | Clicked |
| 1     | 4       | Viewed  |
| 2     | 11      | Viewed  |
| 1     | 2       | Clicked |
+-------+---------+---------+


Result table:

+-------+-------+
| ad_id | ctr   |
+-------+-------+
| 1     | 66.67 |
| 3     | 50.00 |
| 2     | 33.33 |
| 5     | 0.00  |
+-------+-------+
##################################################################

for ad_id = 1, ctr = (2/(2+1)) * 100 = 66.67
for ad_id = 2, ctr = (1/(1+2)) * 100 = 33.33
for ad_id = 3, ctr = (1/(1+1)) * 100 = 50.00
for ad_id = 5, ctr = 0.00, Note that ad_id = 5 has no clicks or views.
Note that we don't care about Ignored Ads.
Result table is ordered by the ctr. in case of a tie we order them
by ad_id
*/

## Solution

USE sql_leedcode;
DROP TABLE IF EXISTS ADS;
CREATE TABLE IF NOT EXISTS ADS (
    ad_id INT,
    user_id INT,
    action ENUM('Clicked', 'Viewed', 'Ignored'),
    PRIMARY KEY (ad_id , user_id)
);
TRUNCATE TABLE ADS;
INSERT INTO ADS VALUES ('1', '1', 'Clicked'),
('2', '2', 'Clicked'),
('3', '3', 'Viewed') ,
('2', '7', 'Viewed') ,
('5', '5', 'Ignored') ,
('7', '7', 'Ignored') ,
('3', '5', 'Clicked') , 
('1', '4', 'Viewed') ,
('2', '11', 'Viewed') ,
('1', '2', 'Clicked');

SELECT 
    *
FROM
    ADS;
    
##################################################################
##                            ANSWER                            ##
##################################################################  

/*
Return the specified value IF the expression is NULL, otherwise 
return the expression:
If the expression is NOT NULL, this function returns the expression.


Syntax:

IFNULL(expression, alt_value)


Round the number to 2 decimal places:

SELECT ROUND(135.375, 2);
result : 135.38
*/

SELECT 
    AD_ID,
    IFNULL(ROUND(SUM(ACTION = 'CLICKED') / SUM(ACTION != 'IGNORED') * 100,2), 0) CTR
FROM
    ADS
GROUP BY AD_ID
ORDER BY CTR DESC , AD_ID;
