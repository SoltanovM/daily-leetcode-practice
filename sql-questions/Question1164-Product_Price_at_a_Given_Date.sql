-- Difficulty : Medium
-- Link to Leetcode Problem : https://leetcode.com/problems/product-price-at-a-given-date/
CREATE SCHEMA Q1164 AUTHORIZATION username;
-- Creating Tables for Question:
CREATE TABLE IF NOT EXISTS Q1164.Products(
    product_id INT,
    new_price INT,
    change_date DATE
);
--------------------------------------------------------------------------
------------------------ Loading datas to tables: ------------------------
------------------------ TABLE : Person ------------------------
INSERT INTO Q1164.Products(product_id, new_price, change_date)
VALUES(1, 20, '2019-08-14');
INSERT INTO Q1164.Products(product_id, new_price, change_date)
VALUES(2, 50, '2019-08-14');
INSERT INTO Q1164.Products(product_id, new_price, change_date)
VALUES(1, 30, '2019-08-15');
INSERT INTO Q1164.Products(product_id, new_price, change_date)
VALUES(1, 35, '2019-08-16');
INSERT INTO Q1164.Products(product_id, new_price, change_date)
VALUES(2, 65, '2019-08-17');
INSERT INTO Q1164.Products(product_id, new_price, change_date)
VALUES(3, 20, '2019-08-18');
--------------------------------------------------------------------------
------------------------ CHECK TABLES ------------------------
SELECT *
FROM Q1164.Products;
--------------------------------------------------------------------------
--------------------------------------------------------------------------
--------------------------------------------------------------------------
-------------------------- Problem Desciption: ---------------------------
'''
Write a solution to find the prices of all products on 2019-08-16. 
Assume the price of all products before any change is 10.

Return the result table in any order.

The result format is in the following example.
Output: 
+------------+-------+
| product_id | price |
+------------+-------+
| 2          | 50    |
| 1          | 35    |
| 3          | 10    |
+------------+-------+

''';
----------------------------- My Solution: ------------------------------
-- Write your MySQL query statement below
WITH LastUpdateBefore_2019_08_16 AS (
    SELECT product_id,
        MAX(change_date) AS lastupdate
    FROM Q1164.Products
    WHERE change_date <= '2019-08-16'
    GROUP BY product_id
),
LastPrice AS (
    SELECT l.product_id,
        l.lastupdate,
        p.new_price
    FROM LastUpdateBefore_2019_08_16 AS l
        INNER JOIN Q1164.Products AS p ON l.lastupdate = p.change_date
        AND l.product_id = p.product_id
),
ProductIds AS(
    SELECT DISTINCT product_id
    FROM Q1164.Products
)
SELECT p.product_id,
    COALESCE(l.new_price, 10) AS price
FROM ProductIds AS p
    LEFT JOIN LastPrice AS l ON l.product_id = p.product_id;
----------------------------- frederikmuller Solution: -------------
-- Write your MySQL query statement below