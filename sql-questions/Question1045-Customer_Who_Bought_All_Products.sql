-- Difficulty : Medium
-- Link to Leetcode Problem : https://leetcode.com/problems/customers-who-bought-all-products/
CREATE SCHEMA Q1045 AUTHORIZATION username;
-- Creating Tables for Question:
CREATE TABLE IF NOT EXISTS Q1045.Customer(customer_id INT, product_key INT);
CREATE TABLE IF NOT EXISTS Q1045.Product(product_key INT PRIMARY KEY);
--------------------------------------------------------------------------
------------------------ Loading datas to tables: ------------------------
------------------------ TABLE : Person ------------------------
INSERT INTO Q1045.Customer(customer_id, product_key)
VALUES(1, 5);
INSERT INTO Q1045.Customer(customer_id, product_key)
VALUES(2, 6);
INSERT INTO Q1045.Customer(customer_id, product_key)
VALUES(3, 5);
INSERT INTO Q1045.Customer(customer_id, product_key)
VALUES(3, 6);
INSERT INTO Q1045.Customer(customer_id, product_key)
VALUES(1, 6);
------------------------ TABLE : Address ------------------------
INSERT INTO Q1045.Product(product_key)
VALUES(5);
INSERT INTO Q1045.Product(product_key)
VALUES(6);
--------------------------------------------------------------------------
------------------------ CHECK TABLES ------------------------
SELECT *
FROM Q1045.Customer;
---
SELECT *
FROM Q1045.Product;
--------------------------------------------------------------------------
--------------------------------------------------------------------------
--------------------------------------------------------------------------
-------------------------- Problem Desciption: ---------------------------
'''
Write a solution to report the customer ids from the Customer table that 
bought all the products in the Product table.

Return the result table in any order.

The result format is in the following example.

 
Output: 
+-------------+
| customer_id |
+-------------+
| 1           |
| 3           |
+-------------+
Explanation: 
The customers who bought all the products (5 and 6) are customers with IDs 1 and 3.
''';
----------------------------- My Solution: ------------------------------
-- # Write your MySQL query statement below
WITH customerListProdcutKey AS (
    SELECT customer_id,
        STRING_AGG(DISTINCT product_key::text, ', ') AS concatenated_values
    FROM Q1045.Customer
    GROUP BY customer_id
),
ListProductKey AS (
    SELECT STRING_AGG(DISTINCT product_key::text, ', ') AS concatenated_values
    FROM Q1045.Product
)
SELECT c.customer_id
FROM customerListProdcutKey AS c
    INNER JOIN ListProductKey AS l ON c.concatenated_values = l.concatenated_values;
----------------------------- frederikmuller Solution: -------------
-- # Write your MySQL query statement below
SELECT 
    c.customer_id
FROM Q1045.Customer AS c
GROUP BY c.customer_id
HAVING COUNT( DISTINCT(c.product_key)) = (
    SELECT COUNT( DISTINCT(p.product_key))
    FROM Q1045.Product AS p
)


SELECT 
    c.customer_id
FROM Customer AS c
GROUP BY c.customer_id
HAVING COUNT( DISTINCT(c.product_key)) = (
    SELECT COUNT( DISTINCT(p.product_key))
    FROM Product AS p
)

