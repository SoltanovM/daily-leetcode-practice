-- Difficulty : Easy
-- Link to Leetcode Problem : https://leetcode.com/problems/trips-and-users/
-- dfaisal solution : https://www.dsfaisal.com/articles/sql/leetcode-sql-problem-solving#574-winning-candidate--medium---leetcode
-- EverydayDataScience Video Solution : https://www.youtube.com/watch?v=b3LphTjCZ8o
CREATE SCHEMA Q1098 AUTHORIZATION username;
-- Creating Tables for Question:
CREATE TABLE IF NOT EXISTS Q1098.Books(
    book_id INT,
    name VARCHAR,
    available_from DATE
);
CREATE TABLE IF NOT EXISTS Q1098.Orders(
    order_id INT PRIMARY KEY,
    book_id INT,
    quantity INT,
    dispatch_date DATE
);
--------------------------------------------------------------------------
------------------------ Loading datas to tables: ------------------------
------------------------ TABLE : Person ------------------------
INSERT INTO Q1098.Books(book_id, name, available_from)
VALUES(1, 'Kalila And Demna', '2010-01-01');
INSERT INTO Q1098.Books(book_id, name, available_from)
VALUES(2, '28 Letters', '2012-05-12');
INSERT INTO Q1098.Books(book_id, name, available_from)
VALUES(3, 'The Hobbit', '2019-06-10');
INSERT INTO Q1098.Books(book_id, name, available_from)
VALUES(4, '13 Reasons Why', '2019-06-01');
VALUES(5, 'The Hunger Games', '2008-09-21');
------------------------ TABLE : Address ------------------------
INSERT INTO Q1098.Orders(order_id, book_id, quantity, dispatch_date)
VALUES(1, 1, 2, '2018-07-26');
INSERT INTO Q1098.Orders(order_id, book_id, quantity, dispatch_date)
VALUES(2, 1, 1, '2018-11-05');
INSERT INTO Q1098.Orders(order_id, book_id, quantity, dispatch_date)
VALUES(3, 3, 8, '2019-06-11');
INSERT INTO Q1098.Orders(order_id, book_id, quantity, dispatch_date)
VALUES(4, 4, 6, '2019-06-05');
INSERT INTO Q1098.Orders(order_id, book_id, quantity, dispatch_date)
VALUES(5, 4, 5, '2019-06-20');
INSERT INTO Q1098.Orders(order_id, book_id, quantity, dispatch_date)
VALUES(6, 5, 9, '2009-02-02');
INSERT INTO Q1098.Orders(order_id, book_id, quantity, dispatch_date)
VALUES(7, 5, 8, '2010-04-13');
--------------------------------------------------------------------------
------------------------ CHECK TABLES ------------------------
SELECT *
FROM Q1098.Books;
---
SELECT *
FROM Q1098.Orders;
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