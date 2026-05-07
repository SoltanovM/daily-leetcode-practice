-- Difficulty : Easy
-- Link to Leetcode Problem : https://leetcode.com/problems/sales-analysis-iii/
CREATE SCHEMA Q1084 AUTHORIZATION username;
-- Creating Tables for Question:
CREATE TABLE IF NOT EXISTS Q1084.Product(
    product_id INT PRIMARY KEY,
    product_name VARCHAR,
    unit_price INT
);
CREATE TABLE IF NOT EXISTS Q1084.Sales(
    seller_id INT,
    product_id INT,
    buyer_id INT,
    sale_date DATE,
    quantity INT,
    price INT
);
--------------------------------------------------------------------------
------------------------ Loading datas to tables: ------------------------
------------------------ TABLE : Person ------------------------
INSERT INTO Q1084.Product(product_id, product_name, unit_price)
VALUES(1, 'S8', 1000);
INSERT INTO Q1084.Product(product_id, product_name, unit_price)
VALUES(2, 'G4', 800);
INSERT INTO Q1084.Product(product_id, product_name, unit_price)
VALUES(3, 'iPhone', 1400);
------------------------ TABLE : Address ------------------------
INSERT INTO Q1084.Sales(
        seller_id,
        product_id,
        buyer_id,
        sale_date,
        quantity,
        price
    )
VALUES(
        1,
        1,
        1,
        '2019-01-21',
        2,
        2000
    );
INSERT INTO Q1084.Sales(
        seller_id,
        product_id,
        buyer_id,
        sale_date,
        quantity,
        price
    )
VALUES(
        1,
        2,
        2,
        '2019-02-17',
        1,
        800
    );
INSERT INTO Q1084.Sales(
        seller_id,
        product_id,
        buyer_id,
        sale_date,
        quantity,
        price
    )
VALUES(
        2,
        2,
        3,
        '2019-06-02',
        1,
        800
    );
INSERT INTO Q1084.Sales(
        seller_id,
        product_id,
        buyer_id,
        sale_date,
        quantity,
        price
    )
VALUES(
        3,
        3,
        4,
        '2019-05-13',
        2,
        2800
    );
--------------------------------------------------------------------------
------------------------ CHECK TABLES ------------------------
SELECT *
FROM Q1084.Product;
---
SELECT *
FROM Q1084.Sales;
--------------------------------------------------------------------------
--------------------------------------------------------------------------
--------------------------------------------------------------------------
-------------------------- Problem Desciption: ---------------------------
'''
Write a solution to report the products that were only sold in the first quarter of 2019. 
That is, between 2019-01-01 and 2019-03-31 inclusive.

Return the result table in any order.

The result format is in the following example.

Output: 
+-------------+--------------+
| product_id  | product_name |
+-------------+--------------+
| 1           | S8           |
+-------------+--------------+
Explanation: 
The product with id 1 was only sold in the spring of 2019.
The product with id 2 was sold in the spring of 2019 but was also sold after the spring of 2019.
The product with id 3 was sold after spring 2019.
We return only product 1 as it is the product that was only sold in the spring of 2019.
''';
----------------------------- My Solution: ------------------------------
-- Write your MySQL query statement below
WITH filteredProducts AS (
    SELECT s.product_id
    FROM Q1084.Sales AS s
    GROUP BY s.product_id
    HAVING MIN(
            CASE
                WHEN s.sale_date BETWEEN '2019-01-01' AND '2019-03-31' THEN 1
                ELSE 0
            END
        ) = 1
)
SELECT p.product_id,
    p.product_name
FROM Q1084.Product AS p
WHERE p.product_id IN (
        SELECT f.product_id
        FROM filteredProducts AS f
    );
----------------------------- frederikmuller Solution: -------------
-- Write your MySQL query statement below