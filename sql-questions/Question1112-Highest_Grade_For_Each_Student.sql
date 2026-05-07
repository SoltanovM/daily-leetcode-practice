-- Difficulty : Easy
-- Link to Leetcode Problem : https://leetcode.com/problems/trips-and-users/
-- dfaisal solution : https://www.dsfaisal.com/articles/sql/leetcode-sql-problem-solving#574-winning-candidate--medium---leetcode
-- EverydayDataScience Video Solution : https://www.youtube.com/watch?v=b3LphTjCZ8o
CREATE SCHEMA Q1112 AUTHORIZATION username;
-- Creating Tables for Question:
CREATE TABLE IF NOT EXISTS Q1112.Enrollments(
    student_id INT,
    course_id INT,
    grade INT
);
--------------------------------------------------------------------------
------------------------ Loading datas to tables: ------------------------
------------------------ TABLE : Enrollments ------------------------
INSERT INTO Q1112.Enrollments(student_id, course_id, grade)
VALUES(2, 2, 95);
INSERT INTO Q1112.Enrollments(student_id, course_id, grade)
VALUES(2, 3, 95);
INSERT INTO Q1112.Enrollments(student_id, course_id, grade)
VALUES(1, 1, 90);
INSERT INTO Q1112.Enrollments(student_id, course_id, grade)
VALUES(1, 2, 99);
INSERT INTO Q1112.Enrollments(student_id, course_id, grade)
VALUES(3, 1, 80);
INSERT INTO Q1112.Enrollments(student_id, course_id, grade)
VALUES(3, 2, 75);
INSERT INTO Q1112.Enrollments(student_id, course_id, grade)
VALUES(3, 3, 82);
--------------------------------------------------------------------------
------------------------ CHECK TABLES ------------------------
SELECT *
FROM Q1112.Enrollments;
--------------------------------------------------------------------------
--------------------------------------------------------------------------
--------------------------------------------------------------------------
-------------------------- Problem Desciption: ---------------------------
'''
Write a solution to report the first name, last name, city, and state of each Enrollments in the Enrollments table. 
If the address of a EnrollmentsId is not present in the Address table, report null instead.

Return the result table in any order.
''';
----------------------------- My Solution: ------------------------------
-- Write your MySQL query statement below
----------------------------- frederikmuller Solution: -------------
-- Write your MySQL query statement below