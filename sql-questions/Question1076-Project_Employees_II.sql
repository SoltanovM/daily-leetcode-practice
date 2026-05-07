-- Difficulty : Easy
-- Link to Leetcode Problem : https://leetcode.com/problems/trips-and-users/
-- dfaisal solution : https://www.dsfaisal.com/articles/sql/leetcode-sql-problem-solving#574-winning-candidate--medium---leetcode
-- EverydayDataScience Video Solution : https://www.youtube.com/watch?v=b3LphTjCZ8o
CREATE SCHEMA Q1076 AUTHORIZATION username;
-- Creating Tables for Question:
CREATE TABLE IF NOT EXISTS Q1076.Project(project_id INT, employee_id INT);
CREATE TABLE IF NOT EXISTS Q1076.Employee(
    employee_id INT PRIMARY KEY,
    name VARCHAR,
    experience_years INT
);
-- DROP TABLE Q1076.Project
--------------------------------------------------------------------------
------------------------ Loading datas to tables: ------------------------
------------------------ TABLE : Person ------------------------
INSERT INTO Q1076.Project(project_id, employee_id)
VALUES(1, 1);
INSERT INTO Q1076.Project(project_id, employee_id)
VALUES(1, 2);
INSERT INTO Q1076.Project(project_id, employee_id)
VALUES(1, 3);
INSERT INTO Q1076.Project(project_id, employee_id)
VALUES(2, 1);
INSERT INTO Q1076.Project(project_id, employee_id)
VALUES(2, 4);
------------------------ TABLE : Address ------------------------
INSERT INTO Q1076.Employee(employee_id, name, experience_years)
VALUES(1, 'Khaled', 3);
INSERT INTO Q1076.Employee(employee_id, name, experience_years)
VALUES(2, 'Ali', 2);
INSERT INTO Q1076.Employee(employee_id, name, experience_years)
VALUES(3, 'John', 1);
INSERT INTO Q1076.Employee(employee_id, name, experience_years)
VALUES(4, 'Doe', 2);
--------------------------------------------------------------------------
------------------------ CHECK TABLES ------------------------
SELECT *
FROM Q1076.Project;
---
SELECT *
FROM Q1076.Employee;
--------------------------------------------------------------------------
--------------------------------------------------------------------------
--------------------------------------------------------------------------
-------------------------- Problem Desciption: ---------------------------
'''
Write a solution to report the first name, last name, city, and state of each person in the Person table. 
If the address of a personId is not present in the Address table, report null instead.

Return the result table in any order.
''';
----------------------------- My Solution: ------------------------------
-- Write your MySQL query statement below
----------------------------- frederikmuller Solution: -------------
-- Write your MySQL query statement below