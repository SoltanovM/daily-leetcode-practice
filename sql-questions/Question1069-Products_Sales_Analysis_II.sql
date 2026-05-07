-- Difficulty : Easy
-- Link to Leetcode Problem : https://leetcode.com/problems/trips-and-users/
-- dfaisal solution : https://www.dsfaisal.com/articles/sql/leetcode-sql-problem-solving#574-winning-candidate--medium---leetcode
-- EverydayDataScience Video Solution : https://www.youtube.com/watch?v=b3LphTjCZ8o
CREATE SCHEMA Q1069 AUTHORIZATION username;
-- Creating Tables for Question:
CREATE TABLE IF NOT EXISTS Q1069.Sales(
    sale_id INT PRIMARY KEY,
    product_id INT,
    year INT,
    quantity INT,
    price INT
);
CREATE TABLE IF NOT EXISTS Q1069.Product(
    product_id INT PRIMARY KEY,
    product_name VARCHAR
);
--------------------------------------------------------------------------
------------------------ Loading datas to tables: ------------------------
------------------------ TABLE : Person ------------------------
INSERT INTO Q1069.Sales(sale_id, product_id, year, quantity, price)
VALUES(1, 100, 2008, 10, 5000);
INSERT INTO Q1069.Sales(sale_id, product_id, year, quantity, price)
VALUES(2, 100, 2009, 12, 5000);
INSERT INTO Q1069.Sales(sale_id, product_id, year, quantity, price)
VALUES(7, 200, 2011, 15, 9000);
------------------------ TABLE : Address ------------------------
INSERT INTO Q1069.Product(product_id, product_name)
VALUES(100, 'Nokia');
INSERT INTO Q1069.Product(product_id, product_name)
VALUES(200, 'Apple');
INSERT INTO Q1069.Product(product_id, product_name)
VALUES(300, 'Samsung');
--------------------------------------------------------------------------
------------------------ CHECK TABLES ------------------------
SELECT *
FROM Q1069.Sales;
---
SELECT *
FROM Q1069.Product;
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