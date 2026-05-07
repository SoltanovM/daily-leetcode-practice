-- Difficulty : Easy
-- Link to Leetcode Problem : https://leetcode.com/problems/trips-and-users/
-- dfaisal solution : https://www.dsfaisal.com/articles/sql/leetcode-sql-problem-solving#574-winning-candidate--medium---leetcode
-- EverydayDataScience Video Solution : https://www.youtube.com/watch?v=b3LphTjCZ8o
CREATE SCHEMA Q596 AUTHORIZATION username;
-- Creating Tables for Question:
CREATE TABLE IF NOT EXISTS Q596.courses(student VARCHAR, class VARCHAR);
--------------------------------------------------------------------------
------------------------ Loading datas to tables: ------------------------
------------------------ TABLE : Person ------------------------
INSERT INTO Q596.courses(student, class)
VALUES('A', 'Math');
INSERT INTO Q596.courses(student, class)
VALUES('B', 'English');
INSERT INTO Q596.courses(student, class)
VALUES('C', 'Math');
INSERT INTO Q596.courses(student, class)
VALUES('D', 'Biology');
INSERT INTO Q596.courses(student, class)
VALUES('E', 'Math');
INSERT INTO Q596.courses(student, class)
VALUES('F', 'Computer');
INSERT INTO Q596.courses(student, class)
VALUES('G', 'Math');
INSERT INTO Q596.courses(student, class)
VALUES('H', 'Math');
INSERT INTO Q596.courses(student, class)
VALUES('I', 'Math');
--------------------------------------------------------------------------
------------------------ CHECK TABLES ------------------------
SELECT *
FROM Q596.courses;
--------------------------------------------------------------------------
--------------------------------------------------------------------------
--------------------------------------------------------------------------
-------------------------- Problem Desciption: ---------------------------
'''
Write a solution to find all the classes that have at least five students.

Return the result table in any order.

The result format is in the following example.

Output: 
+---------+
| class   |
+---------+
| Math    |
+---------+
Explanation: 
- Math has 6 students, so we include it.
- English has 1 student, so we do not include it.
- Biology has 1 student, so we do not include it.
- Computer has 1 student, so we do not include it.

''';
----------------------------- My Solution: ------------------------------
-- Write your MySQL query statement below
SELECT c.class -- COUNT(DISTINCT student)
FROM Q596.courses AS c
GROUP BY class
HAVING COUNT(DISTINCT student) >= 5;
----------------------------- frederikmuller Solution: -------------
-- Write your MySQL query statement below