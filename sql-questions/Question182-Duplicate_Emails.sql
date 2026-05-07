-- Difficulty : Easy
-- Link to Leetcode Problem : https://leetcode.com/problems/duplicate-emails/
-- EverydayDataScience Video Solution : https://www.youtube.com/watch?v=OBxq2iuRVxw
CREATE SCHEMA Q182 AUTHORIZATION username;
-- Creating Tables for Question:
CREATE TABLE IF NOT EXISTS Q182.Person(Id INT PRIMARY KEY, Email VARCHAR);
--------------------------------------------------------------------------
------------------------ Loading datas to tables: ------------------------
------------------------ TABLE : Person ------------------------
INSERT INTO Q182.Person(Id, Email)
VALUES(1, 'a@b.com');
INSERT INTO Q182.Person(Id, Email)
VALUES(2, 'c@d.com');
INSERT INTO Q182.Person(Id, Email)
VALUES(3, 'a@b.com');
--------------------------------------------------------------------------
------------------------ CHECK TABLES ------------------------
SELECT *
FROM Q182.Person;
--------------------------------------------------------------------------
--------------------------------------------------------------------------
--------------------------------------------------------------------------
-------------------------- Problem Desciption: ---------------------------
'''
Write a solution to report all the duplicate emails. 
Note that its guaranteed that the email field is not NULL.

Return the result table in any order.

Output: 
+---------+
| Email   |
+---------+
| a@b.com |
+---------+
Explanation: a@b.com is repeated two times.

''';
----------------------------- My Solution: ------------------------------
-- Write your MySQL query statement below
SELECT email,
    count(email) AS repeatNo
FROM Q182.Person
GROUP BY email;

SELECT email
FROM Person
GROUP BY email
HAVING count(email) > 1;
----------------------------- EverydayDataScience Solution: -------------
-- Write your MySQL query statement below