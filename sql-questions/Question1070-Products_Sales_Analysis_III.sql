-- Difficulty : Medium
-- Link to Leetcode Problem : https://leetcode.com/problems/product-sales-analysis-iii/
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
Write a solution to select the product id, year, quantity, and price for the first year of every product sold.

Return the resulting table in any order.

The result format is in the following example.

Output: 
+------------+------------+----------+-------+
| product_id | first_year | quantity | price |
+------------+------------+----------+-------+ 
| 100        | 2008       | 10       | 5000  |
| 200        | 2011       | 15       | 9000  |
+------------+------------+----------+-------+
''';
----------------------------- My Solution: ------------------------------
-- Write your MySQL query statement below
WITH firstYear AS (
    SELECT MIN(s.year) AS first_year,
        s.product_id
    FROM Q1069.Sales AS s
    GROUP BY s.product_id
)
SELECT s.product_id,
    f.first_year,
    s.quantity,
    s.price
FROM Q1069.Sales AS s
    INNER JOIN firstYear AS f ON f.product_id = s.product_id
    AND f.first_year = s.year;
----------------------------- frederikmuller Solution: -------------
-- Write your MySQL query statement below