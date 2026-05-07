-- Difficulty : Easy
-- Link to Leetcode Problem : https://leetcode.com/problems/trips-and-users/
-- dfaisal solution : https://www.dsfaisal.com/articles/sql/leetcode-sql-problem-solving#574-winning-candidate--medium---leetcode
-- EverydayDataScience Video Solution : https://www.youtube.com/watch?v=b3LphTjCZ8o
CREATE SCHEMA Q584 AUTHORIZATION username;
-- Creating Tables for Question:
CREATE TABLE IF NOT EXISTS Q584.customer(
    id INT PRIMARY KEY,
    name VARCHAR,
    referee_id INT
);
--------------------------------------------------------------------------
------------------------ Loading datas to tables: ------------------------
------------------------ TABLE : Person ------------------------
INSERT INTO Q584.customer(id, name, referee_id)
VALUES(1, 'Will', NULL);
INSERT INTO Q584.customer(id, name, referee_id)
VALUES(2, 'Jane', NULL);
INSERT INTO Q584.customer(id, name, referee_id)
VALUES(3, 'Alex', 2);
INSERT INTO Q584.customer(id, name, referee_id)
VALUES(4, 'Bill', NULL);
INSERT INTO Q584.customer(id, name, referee_id)
VALUES(5, 'Zack', 1);
INSERT INTO Q584.customer(id, name, referee_id)
VALUES(6, 'Mark', 2);
--------------------------------------------------------------------------
------------------------ CHECK TABLES ------------------------
SELECT *
FROM Q584.customer;
--------------------------------------------------------------------------
--------------------------------------------------------------------------
--------------------------------------------------------------------------
-------------------------- Problem Desciption: ---------------------------
'''
Find the names of the customer that are not referred by the customer with id = 2.

Return the result table in any order.

The result format is in the following example.

Output: 
+------+
| name |
+------+
| Will |
| Jane |
| Bill |
| Zack |
+------+

''';
----------------------------- My Solution: ------------------------------
-- Write your MySQL query statement below
SELECT c.name
FROM Q584.customer AS c
WHERE (c.referee_id != 2)
    OR (c.referee_id IS NULL);
----------------------------- frederikmuller Solution: -------------
-- Write your MySQL query statement below