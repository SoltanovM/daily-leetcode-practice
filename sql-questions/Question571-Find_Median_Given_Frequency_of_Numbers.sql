-- Difficulty : Easy
-- Link to Leetcode Problem : https://leetcode.com/problems/trips-and-users/
-- dfaisal solution : https://www.dsfaisal.com/articles/sql/leetcode-sql-problem-solving#574-winning-candidate--medium---leetcode
-- EverydayDataScience Video Solution : https://www.youtube.com/watch?v=b3LphTjCZ8o
CREATE SCHEMA Q571 AUTHORIZATION username;
-- Creating Tables for Question:
CREATE TABLE IF NOT EXISTS Q571.Numbers(Number INT, Frequency INT);
--------------------------------------------------------------------------
------------------------ Loading datas to tables: ------------------------
------------------------ TABLE : Person ------------------------
INSERT INTO Q571.Numbers(Number, Frequency)
VALUES(0, 7);
INSERT INTO Q571.Numbers(Number, Frequency)
VALUES(1, 1);
INSERT INTO Q571.Numbers(Number, Frequency)
VALUES(2, 3);
INSERT INTO Q571.Numbers(Number, Frequency)
VALUES(3, 1);
--------------------------------------------------------------------------
------------------------ CHECK TABLES ------------------------
SELECT *
FROM Q571.Numbers;
-- DROP TABLE Q571.Numbers;
--------------------------------------------------------------------------
--------------------------------------------------------------------------
--------------------------------------------------------------------------
-------------------------- Problem Desciption: ---------------------------
'''
In this table, the numbers are 0, 0, 0, 0, 0, 0, 0, 1, 2, 2, 2, 3, so the median is (0 + 0) / 2 = 0.


+--------+
| median |
+--------|
| 0.0000 |
+--------+
Write a query to find the median of all numbers and name the result as median.

''';
----------------------------- My Solution: ------------------------------
-- Write your MySQL query statement below
WITH tempTable AS (
    SELECT t1.number,
        abs(
            SUM(
                CASE
                    WHEN t1.number > t2.number THEN t2.frequency
                    ELSE 0
                END
            ) - SUM(
                CASE
                    WHEN t1.number < t2.number THEN t2.frequency
                    ELSE 0
                END
            )
        ) AS count_diff
    FROM Q571.Numbers AS t1,
        Q571.Numbers AS t2
    GROUP BY t1.number
)
SELECT avg(n.number) as median
FROM Q571.numbers as n
    JOIN tempTable AS tt ON n.number = tt.number
WHERE n.frequency >= tt.count_diff;
----------------------------- frederikmuller Solution: -------------
-- Write your MySQL query statement below