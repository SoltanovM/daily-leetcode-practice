-- Difficulty : Easy
-- Link to Leetcode Problem : https://leetcode.com/problems/trips-and-users/
-- dfaisal solution : https://www.dsfaisal.com/articles/sql/leetcode-sql-problem-solving#574-winning-candidate--medium---leetcode
-- EverydayDataScience Video Solution : https://www.youtube.com/watch?v=b3LphTjCZ8o
CREATE SCHEMA Q577 AUTHORIZATION username;
-- Creating Tables for Question:
CREATE TABLE IF NOT EXISTS Q577.Employee(
    empId INT PRIMARY KEY,
    name VARCHAR,
    supervisor VARCHAR,
    salary INT
);
CREATE TABLE IF NOT EXISTS Q577.Bonus(empId INT, bonus INT);
--------------------------------------------------------------------------
------------------------ Loading datas to tables: ------------------------
------------------------ TABLE : Employee ------------------------
INSERT INTO Q577.Employee(empId, name, supervisor, salary)
VALUES(1, 'John', 3, 1000);
INSERT INTO Q577.Employee(empId, name, supervisor, salary)
VALUES(2, 'Dan', 3, 2000);
INSERT INTO Q577.Employee(empId, name, supervisor, salary)
VALUES(3, 'Brad', null, 4000);
INSERT INTO Q577.Employee(empId, name, supervisor, salary)
VALUES(4, 'Thomas', 3, 4000);
------------------------ TABLE : Bonus ------------------------
INSERT INTO Q577.Bonus(empId, bonus)
VALUES(2, 500);
INSERT INTO Q577.Bonus(empId, bonus)
VALUES(4, 2000);
--------------------------------------------------------------------------
------------------------ CHECK TABLES ------------------------
SELECT *
FROM Q577.Employee;
---
SELECT *
FROM Q577.Bonus;
--------------------------------------------------------------------------
--------------------------------------------------------------------------
--------------------------------------------------------------------------
-------------------------- Problem Desciption: ---------------------------
'''
Write a solution to report the name and bonus amount of each employee with a bonus less than 1000.

Return the result table in any order.

The result format is in the following example.

Output: 
+------+-------+
| name | bonus |
+------+-------+
| Brad | null  |
| John | null  |
| Dan  | 500   |
+------+-------+

''';
----------------------------- My Solution: ------------------------------
-- Write your MySQL query statement below
SELECT e.name,
    b.bonus
FROM Q577.Employee AS e
    LEFT JOIN Q577.Bonus AS b ON e.empid = b.empid
WHERE (b.bonus < 1000)
    OR (b.bonus IS NULL);
----------------------------- frederikmuller Solution: -------------
-- Write your MySQL query statement below