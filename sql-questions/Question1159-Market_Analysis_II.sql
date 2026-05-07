-- Difficulty : Easy
-- Link to Leetcode Problem : https://leetcode.com/problems/trips-and-users/
-- dfaisal solution : https://www.dsfaisal.com/articles/sql/leetcode-sql-problem-solving#574-winning-candidate--medium---leetcode
-- EverydayDataScience Video Solution : https://www.youtube.com/watch?v=b3LphTjCZ8o
CREATE SCHEMA Q1159 AUTHORIZATION username;
-- Creating Tables for Question:
CREATE TABLE IF NOT EXISTS Q1159.Users(
    user_id INT,
    join_date DATE,
    favorite_brand VARCHAR
);
CREATE TABLE IF NOT EXISTS Q1159.Orders(
    order_id INT,
    order_date DATE,
    item_id INT,
    buyer_id INT,
    seller_id INT
);
CREATE TABLE IF NOT EXISTS Q1159.Items(item_id INT, item_brand VARCHAR);
--------------------------------------------------------------------------
------------------------ Loading datas to tables: ------------------------
------------------------ TABLE : Users ------------------------
INSERT INTO Q1159.Users(user_id, join_date, favorite_brand)
VALUES(1, '2018-01-01', 'Lenovo');
INSERT INTO Q1159.Users(user_id, join_date, favorite_brand)
VALUES(2, '2018-02-09', 'Samsung');
INSERT INTO Q1159.Users(user_id, join_date, favorite_brand)
VALUES(3, '2018-01-19', 'LG');
INSERT INTO Q1159.Users(user_id, join_date, favorite_brand)
VALUES(4, '2018-05-21', 'HP');
------------------------ TABLE : Orders ------------------------
INSERT INTO Q1159.Orders(
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
INSERT INTO Q1159.Orders(
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
INSERT INTO Q1159.Orders(
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
INSERT INTO Q1159.Orders(
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
INSERT INTO Q1159.Orders(
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
INSERT INTO Q1159.Orders(
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
INSERT INTO Q1159.Items(item_id, item_brand)
VALUES(1, 'Samsung');
INSERT INTO Q1159.Items(item_id, item_brand)
VALUES(2, 'Lenovo');
INSERT INTO Q1159.Items(item_id, item_brand)
VALUES(3, 'LG');
INSERT INTO Q1159.Items(item_id, item_brand)
VALUES(4, 'HP');
--------------------------------------------------------------------------
------------------------ CHECK TABLES ------------------------
SELECT *
FROM Q1159.Users;
---
SELECT *
FROM Q1159.Orders;
---
SELECT *
FROM Q1159.Items;
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