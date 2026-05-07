-- Difficulty : Easy
-- Link to Leetcode Problem : https://leetcode.com/problems/trips-and-users/
-- dfaisal solution : https://www.dsfaisal.com/articles/sql/leetcode-sql-problem-solving#574-winning-candidate--medium---leetcode
-- EverydayDataScience Video Solution : https://www.youtube.com/watch?v=b3LphTjCZ8o
CREATE SCHEMA Q580 AUTHORIZATION username;
-- Creating Tables for Question:
CREATE TABLE IF NOT EXISTS Q580.student(
    student_id INT,
    student_name VARCHAR,
    gender VARCHAR,
    dept_id INT
);
CREATE TABLE IF NOT EXISTS Q580.department(dept_id INT, dept_name VARCHAR);
--------------------------------------------------------------------------
------------------------ Loading datas to tables: ------------------------
------------------------ TABLE : Person ------------------------
INSERT INTO Q580.student(student_id, student_name, gender, dept_id)
VALUES(1, 'Jack', 'M', 1);
INSERT INTO Q580.student(student_id, student_name, gender, dept_id)
VALUES(2, 'Jane', 'F', 1);
INSERT INTO Q580.student(student_id, student_name, gender, dept_id)
VALUES(3, 'Mark', 'M', 2);
------------------------ TABLE : Address ------------------------
INSERT INTO Q580.department(dept_id, dept_name)
VALUES(1, 'Engineering');
INSERT INTO Q580.department(dept_id, dept_name)
VALUES(2, 'Science');
INSERT INTO Q580.department(dept_id, dept_name)
VALUES(3, 'Law');
--------------------------------------------------------------------------
------------------------ CHECK TABLES ------------------------
SELECT *
FROM Q580.student;
---
SELECT *
FROM Q580.department;
--------------------------------------------------------------------------
--------------------------------------------------------------------------
--------------------------------------------------------------------------
-------------------------- Problem Desciption: ---------------------------
'''
A university uses 2 data tables, student and department, to store data about its students and the departments associated with each major.

Write a query to print the respective department name and number of students majoring in each department for all departments in the department table (even ones with no current students).

Sort your results by descending number of students; if two or more departments have the same number of students, then sort those departments alphabetically by department name.
''';
----------------------------- My Solution: ------------------------------
-- Write your MySQL query statement below
----------------------------- frederikmuller Solution: -------------
-- Write your MySQL query statement below