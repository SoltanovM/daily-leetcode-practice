-- Difficulty : Easy
-- Link to Leetcode Problem : https://leetcode.com/problems/trips-and-users/
-- dfaisal solution : https://www.dsfaisal.com/articles/sql/leetcode-sql-problem-solving#574-winning-candidate--medium---leetcode
-- EverydayDataScience Video Solution : https://www.youtube.com/watch?v=b3LphTjCZ8o
CREATE SCHEMA Q601 AUTHORIZATION username;
-- Creating Tables for Question:
CREATE TABLE IF NOT EXISTS Q601.Stadium(
    id INT PRIMARY KEY,
    visit_date DATE,
    people INT
);
--------------------------------------------------------------------------
------------------------ Loading datas to tables: ------------------------
------------------------ TABLE : Person ------------------------
INSERT INTO Q601.Stadium(id, visit_date, people)
VALUES(1, '2017-01-01', 10);
INSERT INTO Q601.Stadium(id, visit_date, people)
VALUES(2, '2017-01-02', 109);
INSERT INTO Q601.Stadium(id, visit_date, people)
VALUES(3, '2017-01-03', 150);
INSERT INTO Q601.Stadium(id, visit_date, people)
VALUES(4, '2017-01-04', 99);
INSERT INTO Q601.Stadium(id, visit_date, people)
VALUES(5, '2017-01-05', 145);
INSERT INTO Q601.Stadium(id, visit_date, people)
VALUES(6, '2017-01-06', 1455);
INSERT INTO Q601.Stadium(id, visit_date, people)
VALUES(7, '2017-01-07', 199);
INSERT INTO Q601.Stadium(id, visit_date, people)
VALUES(8, '2017-01-09', 188);
--------------------------------------------------------------------------
------------------------ CHECK TABLES ------------------------
SELECT *
FROM Q601.Stadium;
--------------------------------------------------------------------------
--------------------------------------------------------------------------
--------------------------------------------------------------------------
-------------------------- Problem Desciption: ---------------------------
'''
visit_date is the primary key for this table. 
Each row of this table contains the visit date and visit id to the stadium with the number of people during the visit. 
No two rows will have the same visit_date, and as the id increases, the dates increase as well.

Write an SQL query to display the records with three or more rows with consecutive ids,
and the number of people is greater than or equal to 100 for each.
Return the result table ordered by visit_date in ascending order.

Result table:
+------+------------+-----------+
| id   | visit_date | people    |
+------+------------+-----------+
| 5    | 2017-01-05 | 145       |
| 6    | 2017-01-06 | 1455      |
| 7    | 2017-01-07 | 199       |
| 8    | 2017-01-09 | 188       |
+------+------------+-----------+
The four rows with ids 5, 6, 7, and 8 have consecutive ids and each of them has >= 100 people attended. Note that row 8 was included even though the visit_date was not the next day after row 7.
The rows with ids 2 and 3 are not included because we need at least three consecutive ids.

''';
----------------------------- My Solution: ------------------------------
WITH filteredTable AS(
    SELECT *
    FROM Q601.Stadium AS s
    WHERE s.people >= 100
),
allCombined AS (
    SELECT f1.*
    FROM filteredTable AS f1
        INNER JOIN filteredTable AS f2 ON f1.id = f2.id + 1
        INNER JOIN filteredTable AS f3 ON f1.id = f3.id + 2
    UNION ALL
    SELECT f2.*
    FROM filteredTable AS f1
        INNER JOIN filteredTable AS f2 ON f1.id = f2.id + 1
        INNER JOIN filteredTable AS f3 ON f1.id = f3.id + 2
    UNION ALL
    SELECT f3.*
    FROM filteredTable AS f1
        INNER JOIN filteredTable AS f2 ON f1.id = f2.id + 1
        INNER JOIN filteredTable AS f3 ON f1.id = f3.id + 2
),
threeConsecutive AS (
    SELECT DISTINCT c2.id,
        c2.visit_date,
        c2.people
    FROM allCombined AS c2
)
SELECT *
FROM threeConsecutive
ORDER BY visit_date;
---------------------------- My Solution: ------------------------------
-- Write your MySQL query statement below
WITH twoConsecutive AS (
    SELECT DISTINCT(s1.*)
    FROM Q601.Stadium AS s1
        INNER JOIN Q601.Stadium AS s2 ON (
            s1.visit_date = s2.visit_date + 1
            OR s2.visit_date = s1.visit_date + 1
        )
    WHERE s1.people
    ORDER BY s1.visit_date ASC
),
threeConsecutive AS (
    SELECT DISTINCT(s1.*)
    FROM Q601.Stadium AS s1
        INNER JOIN twoConsecutive AS t2 ON (
            s1.visit_date = t2.visit_date + 1
            OR t2.visit_date = s1.visit_date + 1
        )
    ORDER BY s1.visit_date ASC
)
SELECT t3.*
FROM threeConsecutive AS t3
WHERE people >= 100;
----------------------------- frederikmuller Solution: -------------
-- Write your MySQL query statement below
SELECT DISTINCT s1.*
FROM Q601.Stadium s1
    JOIN Q601.Stadium s2
    JOIN Q601.Stadium s3 ON (
        s1.id = s2.id -1
        AND s1.id = s3.id -2
    )
    OR (
        s1.id = s2.id + 1
        AND s1.id = s3.id -1
    )
    OR (
        s1.id = s2.id + 1
        AND s1.id = s3.id + 2
    )
WHERE s1.people >= 100
    AND s2.people >= 100
    AND s3.people >= 100
ORDER BY visit_date;