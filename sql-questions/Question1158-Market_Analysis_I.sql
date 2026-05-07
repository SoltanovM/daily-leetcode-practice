-- Difficulty : Medium
-- Link to Leetcode Problem : https://leetcode.com/problems/market-analysis-i/
CREATE SCHEMA Q1158 AUTHORIZATION username;
-- Creating Tables for Question:
CREATE TABLE IF NOT EXISTS Q1158.Users(
    user_id INT,
    join_date DATE,
    favorite_brand VARCHAR
);
CREATE TABLE IF NOT EXISTS Q1158.Orders(
    order_id INT,
    order_date DATE,
    item_id INT,
    buyer_id INT,
    seller_id INT
);
CREATE TABLE IF NOT EXISTS Q1158.Items(item_id INT, item_brand VARCHAR);
--------------------------------------------------------------------------
------------------------ Loading datas to tables: ------------------------
------------------------ TABLE : Users ------------------------
INSERT INTO Q1158.Users(user_id, join_date, favorite_brand)
VALUES(1, '2018-01-01', 'Lenovo');
INSERT INTO Q1158.Users(user_id, join_date, favorite_brand)
VALUES(2, '2018-02-09', 'Samsung');
INSERT INTO Q1158.Users(user_id, join_date, favorite_brand)
VALUES(3, '2018-01-19', 'LG');
INSERT INTO Q1158.Users(user_id, join_date, favorite_brand)
VALUES(4, '2018-05-21', 'HP');
------------------------ TABLE : Orders ------------------------
INSERT INTO Q1158.Orders(
        order_id,
        order_date,
        item_id,
        buyer_id,
        seller_id
    )
VALUES(
        1,
        '2019-08-01',
        4,
        1,
        2
    );
INSERT INTO Q1158.Orders(
        order_id,
        order_date,
        item_id,
        buyer_id,
        seller_id
    )
VALUES(
        2,
        '2018-08-02',
        2,
        1,
        3
    );
INSERT INTO Q1158.Orders(
        order_id,
        order_date,
        item_id,
        buyer_id,
        seller_id
    )
VALUES(
        3,
        '2019-08-03',
        3,
        2,
        3
    );
INSERT INTO Q1158.Orders(
        order_id,
        order_date,
        item_id,
        buyer_id,
        seller_id
    )
VALUES(
        4,
        '2018-08-04',
        1,
        4,
        2
    );
INSERT INTO Q1158.Orders(
        order_id,
        order_date,
        item_id,
        buyer_id,
        seller_id
    )
VALUES(
        5,
        '2018-08-04',
        1,
        3,
        4
    );
INSERT INTO Q1158.Orders(
        order_id,
        order_date,
        item_id,
        buyer_id,
        seller_id
    )
VALUES(
        6,
        '2019-08-05',
        2,
        2,
        4
    );
------------------------ TABLE : Items ------------------------
INSERT INTO Q1158.Items(item_id, item_brand)
VALUES(1, 'Samsung');
INSERT INTO Q1158.Items(item_id, item_brand)
VALUES(2, 'Lenovo');
INSERT INTO Q1158.Items(item_id, item_brand)
VALUES(3, 'LG');
INSERT INTO Q1158.Items(item_id, item_brand)
VALUES(4, 'HP');
--------------------------------------------------------------------------
------------------------ CHECK TABLES ------------------------
SELECT *
FROM Q1158.Users;
---
SELECT *
FROM Q1158.Orders;
---
SELECT *
FROM Q1158.Items;
--------------------------------------------------------------------------
--------------------------------------------------------------------------
--------------------------------------------------------------------------
-------------------------- Problem Desciption: ---------------------------
'''
Write a solution to find for each user, the join date and the number of orders they made as a buyer in 2019.

Return the result table in any order.

The result format is in the following example.

Output: 
+-----------+------------+----------------+
| buyer_id  | join_date  | orders_in_2019 |
+-----------+------------+----------------+
| 1         | 2018-01-01 | 1              |
| 2         | 2018-02-09 | 2              |
| 3         | 2018-01-19 | 0              |
| 4         | 2018-05-21 | 0              |
+-----------+------------+----------------+
''';
----------------------------- My Solution: ------------------------------
-- Write your MySQL query statement below
WITH orders_no AS (
    SELECT o.buyer_id,
        COUNT(o.order_id) AS orders_in_2019
    FROM Q1158.Orders AS o
    WHERE EXTRACT(
            YEAR
            FROM o.order_date
        ) = 2019
    GROUP BY o.buyer_id
)
SELECT u.user_id AS buyer_id,
    u.join_date,
    COALESCE(orders_no.orders_in_2019, 0) AS orders_in_2019
FROM Q1158.Users AS u
    LEFT JOIN orders_no ON orders_no.buyer_id = u.user_id;
----------------------------- frederikmuller Solution: -------------
-- Write your MySQL query statement below