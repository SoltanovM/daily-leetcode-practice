-- Difficulty : Meium
-- Link to Leetcode Problem : https://leetcode.com/problems/rank-scores/
-- EverydayDataScience Video Solution : https://www.youtube.com/watch?v=IEaEdvzmz2g
CREATE SCHEMA Q178 AUTHORIZATION username;
-- Creating Tables for Question:
CREATE TABLE IF NOT EXISTS Q178.Scores(Id INT PRIMARY KEY, Score DECIMAL);
--------------------------------------------------------------------------
------------------------ Loading datas to tables: ------------------------
------------------------ TABLE : Person ------------------------
INSERT INTO Q178.Scores(Id, Score)
VALUES(1, 3.50);
INSERT INTO Q178.Scores(Id, Score)
VALUES(2, 3.65);
INSERT INTO Q178.Scores(Id, Score)
VALUES(3, 4.00);
INSERT INTO Q178.Scores(Id, Score)
VALUES(4, 3.85);
INSERT INTO Q178.Scores(Id, Score)
VALUES(5, 4.00);
INSERT INTO Q178.Scores(Id, Score)
VALUES(6, 3.65);
--------------------------------------------------------------------------
------------------------ CHECK TABLES ------------------------
SELECT *
FROM Q178.Scores;
--------------------------------------------------------------------------
--------------------------------------------------------------------------
--------------------------------------------------------------------------
-------------------------- Problem Desciption: ---------------------------
'''
Write a solution to find the rank of the scores. 
The ranking should be calculated according to the following rules:

The scores should be ranked from the highest to the lowest.
If there is a tie between two scores, both should have the same ranking.
After a tie, the next ranking number should be the next consecutive integer value. 
In other words, there should be no holes between ranks.
Return the result table ordered by score in descending order.

The result format is in the following example.

Output: 
+-------+------+
| score | rank |
+-------+------+
| 4.00  | 1    |
| 4.00  | 1    |
| 3.85  | 2    |
| 3.65  | 3    |
| 3.65  | 3    |
| 3.50  | 4    |
+-------+------+

''';
----------------------------- My Solution: ------------------------------
-- # Write your MySQL query statement below
SELECT score,
    DENSE_RANK() OVER(
        ORDER BY score DESC
    ) AS rank
FROM Q178.Scores;
