-- Difficulty : Easy
-- Link to Leetcode Problem : https://leetcode.com/problems/trips-and-users/
-- dfaisal solution : https://www.dsfaisal.com/articles/sql/leetcode-sql-problem-solving#574-winning-candidate--medium---leetcode
-- EverydayDataScience Video Solution : https://www.youtube.com/watch?v=b3LphTjCZ8o
CREATE SCHEMA Q579 AUTHORIZATION username;
-- Creating Tables for Question:
CREATE TABLE IF NOT EXISTS Q579.Employee(Id INT, Month INT, Salary INT);
--------------------------------------------------------------------------
------------------------ Loading datas to tables: ------------------------
------------------------ TABLE : Employee ------------------------
INSERT INTO Q579.Employee(Id, Month, Salary)
VALUES(1, 1, 20);
INSERT INTO Q579.Employee(Id, Month, Salary)
VALUES(2, 1, 20);
INSERT INTO Q579.Employee(Id, Month, Salary)
VALUES(1, 2, 30);
INSERT INTO Q579.Employee(Id, Month, Salary)
VALUES(2, 2, 30);
INSERT INTO Q579.Employee(Id, Month, Salary)
VALUES(3, 2, 40);
INSERT INTO Q579.Employee(Id, Month, Salary)
VALUES(1, 3, 40);
INSERT INTO Q579.Employee(Id, Month, Salary)
VALUES(3, 3, 60);
INSERT INTO Q579.Employee(Id, Month, Salary)
VALUES(1, 4, 60);
INSERT INTO Q579.Employee(Id, Month, Salary)
VALUES(3, 4, 70);
--------------------------------------------------------------------------
------------------------ CHECK TABLES ------------------------
SELECT *
FROM Q579.Employee;
--------------------------------------------------------------------------
--------------------------------------------------------------------------
--------------------------------------------------------------------------
-------------------------- Problem Desciption: ---------------------------
'''
The Employee table holds the salary information in a year.

Write a SQL to get the cumulative sum of an employee’s salary over a period of 3 months but exclude the most recent month.

The result should be displayed by ‘Id’ ascending, and then by ‘Month’ descending.
''';
----------------------------- My Solution: ------------------------------
-- Write your MySQL query statement below
----------------------------- frederikmuller Solution: -------------
-- Write your MySQL query statement below