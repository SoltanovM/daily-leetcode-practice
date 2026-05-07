-- Difficulty : Easy
-- Link to Leetcode Problem : https://leetcode.com/problems/trips-and-users/
-- dfaisal solution : https://www.dsfaisal.com/articles/sql/leetcode-sql-problem-solving#574-winning-candidate--medium---leetcode
-- EverydayDataScience Video Solution : https://www.youtube.com/watch?v=b3LphTjCZ8o
CREATE SCHEMA Q1173 AUTHORIZATION username;
-- Creating Tables for Question:
CREATE TABLE IF NOT EXISTS Q1173.Delivery(
    delivery_id INT,
    customer_id INT,
    order_date DATE,
    customer_pref_delivery_date DATE
);
--------------------------------------------------------------------------
------------------------ Loading datas to tables: ------------------------
------------------------ TABLE : Person ------------------------
INSERT INTO Q1173.Delivery(
        delivery_id,
        customer_id,
        order_date,
        customer_pref_delivery_date
    )
VALUES(
        1,
        1,
        '2019-08-01',
        '2019-08-02'
    );
INSERT INTO Q1173.Delivery(
        delivery_id,
        customer_id,
        order_date,
        customer_pref_delivery_date
    )
VALUES(
        2,
        5,
        '2019-08-02',
        '2019-08-02'
    );
INSERT INTO Q1173.Delivery(
        delivery_id,
        customer_id,
        order_date,
        customer_pref_delivery_date
    )
VALUES(
        3,
        1,
        '2019-08-11',
        '2019-08-11'
    );
INSERT INTO Q1173.Delivery(
        delivery_id,
        customer_id,
        order_date,
        customer_pref_delivery_date
    )
VALUES(
        4,
        3,
        '2019-08-24',
        '2019-08-26'
    );
INSERT INTO Q1173.Delivery(
        delivery_id,
        customer_id,
        order_date,
        customer_pref_delivery_date
    )
VALUES(
        5,
        4,
        '2019-08-21',
        '2019-08-22'
    );
INSERT INTO Q1173.Delivery(
        delivery_id,
        customer_id,
        order_date,
        customer_pref_delivery_date
    )
VALUES(
        6,
        2,
        '2019-08-11',
        '2019-08-13'
    );
--------------------------------------------------------------------------
------------------------ CHECK TABLES ------------------------
SELECT *
FROM Q1173.Delivery;
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