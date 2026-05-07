-- Difficulty : Easy
-- Link to Leetcode Problem : https://leetcode.com/problems/trips-and-users/
-- dfaisal solution : https://www.dsfaisal.com/articles/sql/leetcode-sql-problem-solving#574-winning-candidate--medium---leetcode
-- EverydayDataScience Video Solution : https://www.youtube.com/watch?v=b3LphTjCZ8o
CREATE SCHEMA Q610 AUTHORIZATION username;
-- Creating Tables for Question:
CREATE TABLE IF NOT EXISTS Q610.triangle(x INT, y INT, z INT);
--------------------------------------------------------------------------
------------------------ Loading datas to tables: ------------------------
------------------------ TABLE : Person ------------------------
INSERT INTO Q610.triangle(x, y, z)
VALUES(13, 15, 30);
INSERT INTO Q610.triangle(x, y, z)
VALUES(10, 20, 15);
--------------------------------------------------------------------------
------------------------ CHECK TABLES ------------------------
SELECT *
FROM Q610.triangle;
--------------------------------------------------------------------------
--------------------------------------------------------------------------
--------------------------------------------------------------------------
-------------------------- Problem Desciption: ---------------------------
'''
Report for every three line segments whether they can form a triangle.

Return the result table in any order.

The result format is in the following example.

Output: 
+----+----+----+----------+
| x  | y  | z  | triangle |
+----+----+----+----------+
| 13 | 15 | 30 | No       |
| 10 | 20 | 15 | Yes      |
+----+----+----+----------+
''';
----------------------------- My Solution: ------------------------------
-- Write your MySQL query statement below
SELECT x,
    y,
    z,
    CASE
        WHEN (x + y) > z
        AND (x + z) > y
        AND (z + y) > x THEN 'Yes'
        ELSE 'No'
    END AS triangle
FROM Q610.triangle;
----------------------------- frederikmuller Solution: -------------
-- Write your MySQL query statement below