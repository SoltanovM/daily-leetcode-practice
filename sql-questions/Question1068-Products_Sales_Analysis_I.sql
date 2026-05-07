-- Difficulty : Easy
-- Link to Leetcode Problem : https://leetcode.com/problems/product-sales-analysis-i/
CREATE SCHEMA Q1068 AUTHORIZATION username;
-- Creating Tables for Question:
CREATE TABLE IF NOT EXISTS Q1068.Sales(
    sale_id INT PRIMARY KEY,
    product_id INT,
    year INT,
    quantity INT,
    price INT
);
CREATE TABLE IF NOT EXISTS Q1068.Product(
    product_id INT PRIMARY KEY,
    product_name VARCHAR
);
--------------------------------------------------------------------------
------------------------ Loading datas to tables: ------------------------
------------------------ TABLE : Person ------------------------
INSERT INTO Q1068.Sales(sale_id, product_id, year, quantity, price)
VALUES(1, 100, 2008, 10, 5000);
INSERT INTO Q1068.Sales(sale_id, product_id, year, quantity, price)
VALUES(2, 100, 2009, 12, 5000);
INSERT INTO Q1068.Sales(sale_id, product_id, year, quantity, price)
VALUES(7, 200, 2011, 15, 9000);
------------------------ TABLE : Address ------------------------
INSERT INTO Q1068.Product(product_id, product_name)
VALUES(100, 'Nokia');
INSERT INTO Q1068.Product(product_id, product_name)
VALUES(200, 'Apple');
INSERT INTO Q1068.Product(product_id, product_name)
VALUES(300, 'Samsung');
--------------------------------------------------------------------------
------------------------ CHECK TABLES ------------------------
SELECT *
FROM Q1068.Sales;
---
SELECT *
FROM Q1068.Product;
--------------------------------------------------------------------------
--------------------------------------------------------------------------
--------------------------------------------------------------------------
-------------------------- Problem Desciption: ---------------------------
'''
Write a solution to report the product_name, year, and price for each sale_id in the Sales table.

Return the resulting table in any order.

The result format is in the following example.

Output: 
+--------------+-------+-------+
| product_name | year  | price |
+--------------+-------+-------+
| Nokia        | 2008  | 5000  |
| Nokia        | 2009  | 5000  |
| Apple        | 2011  | 9000  |
+--------------+-------+-------+
Explanation: 
From sale_id = 1, we can conclude that Nokia was sold for 5000 in the year 2008.
From sale_id = 2, we can conclude that Nokia was sold for 5000 in the year 2009.
From sale_id = 7, we can conclude that Apple was sold for 9000 in the year 2011.
''';
----------------------------- My Solution: ------------------------------
-- Write your MySQL query statement below
SELECT p.product_name,
    s.year,
    s.price
FROM Q1068.Sales AS s
    LEFT JOIN Q1068.Product AS p ON s.product_id = p.product_id;
----------------------------- frederikmuller Solution: -------------
-- Write your MySQL query statement below