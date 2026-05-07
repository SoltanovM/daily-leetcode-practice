-- Difficulty : Easy
-- Link to Leetcode Problem : https://leetcode.com/problems/project-employees-i/
CREATE SCHEMA Q1075 AUTHORIZATION username;
-- Creating Tables for Question:
CREATE TABLE IF NOT EXISTS Q1075.Project(project_id INT, employee_id INT);
CREATE TABLE IF NOT EXISTS Q1075.Employee(
    employee_id INT PRIMARY KEY,
    name VARCHAR,
    experience_years INT
);
-- DROP TABLE Q1075.Project
--------------------------------------------------------------------------
------------------------ Loading datas to tables: ------------------------
------------------------ TABLE : Person ------------------------
INSERT INTO Q1075.Project(project_id, employee_id)
VALUES(1, 1);
INSERT INTO Q1075.Project(project_id, employee_id)
VALUES(1, 2);
INSERT INTO Q1075.Project(project_id, employee_id)
VALUES(1, 3);
INSERT INTO Q1075.Project(project_id, employee_id)
VALUES(2, 1);
INSERT INTO Q1075.Project(project_id, employee_id)
VALUES(2, 4);
------------------------ TABLE : Address ------------------------
INSERT INTO Q1075.Employee(employee_id, name, experience_years)
VALUES(1, 'Khaled', 3);
INSERT INTO Q1075.Employee(employee_id, name, experience_years)
VALUES(2, 'Ali', 2);
INSERT INTO Q1075.Employee(employee_id, name, experience_years)
VALUES(3, 'John', 1);
INSERT INTO Q1075.Employee(employee_id, name, experience_years)
VALUES(4, 'Doe', 2);
--------------------------------------------------------------------------
------------------------ CHECK TABLES ------------------------
SELECT *
FROM Q1075.Project;
---
SELECT *
FROM Q1075.Employee;
--------------------------------------------------------------------------
--------------------------------------------------------------------------
--------------------------------------------------------------------------
-------------------------- Problem Desciption: ---------------------------
'''
Write an SQL query that reports the average experience 
years of all the employees for each project, rounded to 2 digits.

Return the result table in any order.

The query result format is in the following example.

Output: 
+-------------+---------------+
| project_id  | average_years |
+-------------+---------------+
| 1           | 2.00          |
| 2           | 2.50          |
+-------------+---------------+
Explanation: The average experience years for the first project is 
(3 + 2 + 1) / 3 = 2.00 and for the second project is (3 + 2) / 2 = 2.50
''';
----------------------------- My Solution: ------------------------------
-- Write your MySQL query statement below
SELECT p.project_id,
    ROUND(AVG(e.experience_years), 2) AS average_years
FROM Q1075.Project AS p
    LEFT JOIN Q1075.Employee AS e ON p.employee_id = e.employee_id
GROUP BY p.project_id;
----------------------------- frederikmuller Solution: -------------
-- Write your MySQL query statement below