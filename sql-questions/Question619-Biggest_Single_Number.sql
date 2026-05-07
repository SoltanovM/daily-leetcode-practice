-- Difficulty : Easy
-- Link to Leetcode Problem : https://leetcode.com/problems/trips-and-users/
-- dfaisal solution : https://www.dsfaisal.com/articles/sql/leetcode-sql-problem-solving#574-winning-candidate--medium---leetcode
-- EverydayDataScience Video Solution : https://www.youtube.com/watch?v=b3LphTjCZ8o
CREATE SCHEMA Q619 AUTHORIZATION username;
-- Creating Tables for Question:
CREATE TABLE IF NOT EXISTS Q619.number(num INT);
--------------------------------------------------------------------------
------------------------ Loading datas to tables: ------------------------
------------------------ TABLE : Person ------------------------
INSERT INTO Q619.number(num)
VALUES(8);
INSERT INTO Q619.number(num)
VALUES(8);
INSERT INTO Q619.number(num)
VALUES(3);
INSERT INTO Q619.number(num)
VALUES(3);
INSERT INTO Q619.number(num)
VALUES(1);
INSERT INTO Q619.number(num)
VALUES(4);
INSERT INTO Q619.number(num)
VALUES(5);
INSERT INTO Q619.number(num)
VALUES(6);
--------------------------------------------------------------------------
------------------------ CHECK TABLES ------------------------
SELECT *
FROM Q619.number;
--------------------------------------------------------------------------
--------------------------------------------------------------------------
--------------------------------------------------------------------------
-------------------------- Problem Desciption: ---------------------------
'''
A single number is a number that appeared only once in the MyNumbers table.

Find the largest single number. If there is no single number, report null.

The result format is in the following example.

Output: 
+-----+
| num |
+-----+
| 6   |
+-----+
Explanation: The single numbers are 1, 4, 5, and 6.
Since 6 is the largest single number, we return it.
''';
----------------------------- My Solution: ------------------------------
-- Write your MySQL query statement below
WITH singleNums AS (
    SELECT num -- COUNT(num)
    FROM Q619.number
    GROUP BY num
    HAVING COUNT(num) = 1
    ORDER BY num DESC
)
SELECT CASE
        WHEN COUNT(*) = 0 THEN NULL
        ELSE MAX(num)
    END AS num
FROM singleNums;
----------------------------- frederikmuller Solution: -------------
-- Write your MySQL query statement below