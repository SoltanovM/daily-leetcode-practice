-- Difficulty : Medium
-- Link to Leetcode Problem : https://leetcode.com/problems/consecutive-numbers/
-- EverydayDataScience Video Solution : https://www.youtube.com/watch?v=iNaLjT9ybYI
CREATE SCHEMA Q180 AUTHORIZATION username;
-- Creating Tables for Question:
CREATE TABLE IF NOT EXISTS Q180.Logs(Id INT PRIMARY KEY, Num VARCHAR);
--------------------------------------------------------------------------
------------------------ Loading datas to tables: ------------------------
------------------------ TABLE : Person ------------------------
INSERT INTO Q180.Logs(Id, Num)
VALUES(1, '1');
INSERT INTO Q180.Logs(Id, Num)
VALUES(2, '1');
INSERT INTO Q180.Logs(Id, Num)
VALUES(3, '1');
INSERT INTO Q180.Logs(Id, Num)
VALUES(4, '2');
INSERT INTO Q180.Logs(Id, Num)
VALUES(5, '1');
INSERT INTO Q180.Logs(Id, Num)
VALUES(6, '2');
INSERT INTO Q180.Logs(Id, Num)
VALUES(7, '2');
--------------------------------------------------------------------------
------------------------ CHECK TABLES ------------------------
SELECT 
    id + 1 as adjusted_ids,
    num
FROM Q180.Logs;
--------------------------------------------------------------------------
--------------------------------------------------------------------------
--------------------------------------------------------------------------
-------------------------- Problem Desciption: ---------------------------
'''
Write an SQL query to find all numbers that appear at least three times consecutively.

Return the result table in any order.

The query result format is in the following example:

Output: 
+-----------------+
| ConsecutiveNums |
+-----------------+
| 1               |
+-----------------+
''';
----------------------------- My Solution: ------------------------------
SELECT DISTINCT(t1.num) AS ConsecutiveNums
FROM Q180.Logs AS t1
INNER JOIN Q180.Logs AS t2 ON t2.id = t1.id + 1 AND t2.num = t1.num
INNER JOIN Q180.Logs AS t3 ON t3.id = t1.id + 2 AND t3.num = t1.num;