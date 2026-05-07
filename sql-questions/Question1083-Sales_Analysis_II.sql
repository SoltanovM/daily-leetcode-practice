-- Difficulty : Easy
-- Link to Leetcode Problem : https://leetcode.com/problems/trips-and-users/
-- dfaisal solution : https://www.dsfaisal.com/articles/sql/leetcode-sql-problem-solving#574-winning-candidate--medium---leetcode
-- EverydayDataScience Video Solution : https://www.youtube.com/watch?v=b3LphTjCZ8o
CREATE SCHEMA Q1083 AUTHORIZATION username;
-- Creating Tables for Question:
CREATE TABLE IF NOT EXISTS Q1083.Product(
    product_id INT PRIMARY KEY,
    product_name VARCHAR,
    unit_price INT
);
CREATE TABLE IF NOT EXISTS Q1083.Sales(
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
INSERT INTO Q1083.Product(product_id, product_name, unit_price)
VALUES(1, 'S8', 1000);
INSERT INTO Q1083.Product(product_id, product_name, unit_price)
VALUES(2, 'G4', 800);
INSERT INTO Q1083.Product(product_id, product_name, unit_price)
VALUES(3, 'iPhone', 1400);
------------------------ TABLE : Address ------------------------
INSERT INTO Q1083.Sales(
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
INSERT INTO Q1083.Sales(
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
INSERT INTO Q1083.Sales(
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
INSERT INTO Q1083.Sales(
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
FROM Q1083.Product;
---
SELECT *
FROM Q1083.Sales;
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