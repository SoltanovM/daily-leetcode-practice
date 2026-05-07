-- Difficulty : Easy
-- Link to Leetcode Problem : https://leetcode.com/problems/trips-and-users/
-- dfaisal solution : https://www.dsfaisal.com/articles/sql/leetcode-sql-problem-solving#574-winning-candidate--medium---leetcode
-- EverydayDataScience Video Solution : https://www.youtube.com/watch?v=b3LphTjCZ8o
CREATE SCHEMA Q615 AUTHORIZATION username;
-- Creating Tables for Question:
CREATE TABLE IF NOT EXISTS Q615.salary(
    id INT PRIMARY KEY,
    employee_id INT,
    amount INT,
    paydate DATE
);
CREATE TABLE IF NOT EXISTS Q615.employee(
    employee INT PRIMARY KEY,
    department_id INT
);
--------------------------------------------------------------------------
------------------------ Loading datas to tables: ------------------------
------------------------ TABLE : Person ------------------------
INSERT INTO Q615.salary(id, employee_id, amount, paydate)
VALUES(1, 1, 9000, '2017-03-31');
INSERT INTO Q615.salary(id, employee_id, amount, paydate)
VALUES(2, 2, 6000, '2017-03-31');
INSERT INTO Q615.salary(id, employee_id, amount, paydate)
VALUES(3, 3, 10000, '2017-03-31');
INSERT INTO Q615.salary(id, employee_id, amount, paydate)
VALUES(4, 1, 7000, '2017-02-28');
INSERT INTO Q615.salary(id, employee_id, amount, paydate)
VALUES(5, 2, 6000, '2017-02-28');
INSERT INTO Q615.salary(id, employee_id, amount, paydate)
VALUES(6, 3, 8000, '2017-02-28');
------------------------ TABLE : Address ------------------------
INSERT INTO Q615.employee(employee, department_id)
VALUES(1, 1);
INSERT INTO Q615.employee(employee, department_id)
VALUES(2, 2);
INSERT INTO Q615.employee(employee, department_id)
VALUES(3, 2);
--------------------------------------------------------------------------
------------------------ CHECK TABLES ------------------------
SELECT *
FROM Q615.salary;
---
SELECT *
FROM Q615.employee;
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