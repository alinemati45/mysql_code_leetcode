/*

There is a table World


+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| name        | varchar |
| continent   | varchar |
| area        | int     |
| population  | int     |
| gdp         | int     |
+-------------+---------+
name is the primary key column for this table.

Each row of this table gives information about the name of a
country, the continent to which it belongs, its area, the 
population, and its GDP value.



+-----------------+------------+------------+--------------+---------------+
| name            | continent  | area       | population   | gdp           |
+-----------------+------------+------------+--------------+---------------+
| Afghanistan     | Asia       | 652230     | 25500100     | 20343000      |
| Albania         | Europe     | 28748      | 2831741      | 12960000      |
| Algeria         | Africa     | 2381741    | 37100000     | 188681000     |
| Andorra         | Europe     | 468        | 78115        | 3712000       |
| Angola          | Africa     | 1246700    | 20609294     | 100990000     |
+-----------------+------------+------------+--------------+---------------+

##################################################################

A country is big if:

it has an area of at least three million (i.e., 3000000 km2), or
it has a population of at least twenty-five million (i.e., 25000000).
Write an SQL query to report the name, population, and area of
the big countries.

Return the result table in any order.

The query result format is in the following example.

 

A country is big if it has an area of bigger than 3 million
square km or a 
population of more than 25 million.

Write a SQL solution to output big countries' name, population
and area.


For example, according to the above table, we should output:

+--------------+-------------+--------------+
| name         | population  | area         |
+--------------+-------------+--------------+
| Afghanistan  | 25500100    | 652230       |
| Algeria      | 37100000    | 2381741      |
+--------------+-------------+--------------+

*/

## Solution


USE SQL_LEEDCODE;

DROP TABLE IF EXISTS WORLD;

CREATE TABLE IF NOT EXISTS WORLD (
    NAME VARCHAR(255),
    CONTINENT VARCHAR(255),
    AREA INT,
    POPULATION INT,
    GDP LONG
);
TRUNCATE TABLE WORLD;
INSERT INTO WORLD (NAME, CONTINENT, AREA, POPULATION, GDP) 
VALUES ('AFGHANISTAN', 'ASIA','652230', '25500100','20343000000');
INSERT INTO WORLD (NAME, CONTINENT, AREA, POPULATION, GDP) VALUES 
('ALBANIA', 'EUROPE', '28748', '2831741', '12960000000');
INSERT INTO WORLD (NAME, CONTINENT, AREA, POPULATION, GDP) VALUES
('ALGERIA', 'AFRICA', '2381741', '37100000', '188681000000');
INSERT INTO WORLD (NAME, CONTINENT, AREA, POPULATION, GDP) VALUES 
('ANDORRA', 'EUROPE', '468', '78115', '3712000000');
INSERT INTO WORLD (NAME, CONTINENT, AREA, POPULATION, GDP) VALUES 
('ANGOLA', 'AFRICA', '1246700', '20609294', '100990000000');

SELECT 
    *
FROM
    WORLD;


##################################################################
##                            ANSWER                            ##
##################################################################

SELECT 
    NAME, POPULATION, AREA
FROM
    WORLD
WHERE
    POPULATION > 25000000 OR AREA > 3000000;


