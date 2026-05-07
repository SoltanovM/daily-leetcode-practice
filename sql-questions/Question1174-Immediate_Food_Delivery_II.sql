-- Difficulty : Medium
-- Link to Leetcode Problem : https://leetcode.com/problems/immediate-food-delivery-ii/
CREATE SCHEMA Q1174 AUTHORIZATION username;
-- Creating Tables for Question:
CREATE TABLE IF NOT EXISTS Q1174.Delivery(
    delivery_id INT,
    customer_id INT,
    order_date DATE,
    customer_pref_delivery_date DATE
);
--------------------------------------------------------------------------
------------------------ Loading datas to tables: ------------------------
------------------------ TABLE : Person ------------------------
INSERT INTO Q1174.Delivery(
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
INSERT INTO Q1174.Delivery(
        delivery_id,
        customer_id,
        order_date,
        customer_pref_delivery_date
    )
VALUES(
        2,
        2,
        '2019-08-02',
        '2019-08-02'
    );
INSERT INTO Q1174.Delivery(
        delivery_id,
        customer_id,
        order_date,
        customer_pref_delivery_date
    )
VALUES(
        3,
        1,
        '2019-08-11',
        '2019-08-12'
    );
INSERT INTO Q1174.Delivery(
        delivery_id,
        customer_id,
        order_date,
        customer_pref_delivery_date
    )
VALUES(
        4,
        3,
        '2019-08-24',
        '2019-08-24'
    );
INSERT INTO Q1174.Delivery(
        delivery_id,
        customer_id,
        order_date,
        customer_pref_delivery_date
    )
VALUES(
        5,
        3,
        '2019-08-21',
        '2019-08-22'
    );
INSERT INTO Q1174.Delivery(
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
INSERT INTO Q1174.Delivery(
        delivery_id,
        customer_id,
        order_date,
        customer_pref_delivery_date
    )
VALUES(
        7,
        4,
        '2019-08-09',
        '2019-08-09'
    );
--------------------------------------------------------------------------
------------------------ CHECK TABLES ------------------------
SELECT *
FROM Q1174.Delivery;
-- DELETE FROM Q1174.Delivery;
--------------------------------------------------------------------------
--------------------------------------------------------------------------
--------------------------------------------------------------------------
-------------------------- Problem Desciption: ---------------------------
'''
If the customers preferred delivery date is the same as the order date, 
then the order is called immediate; otherwise, it is called scheduled.

The first order of a customer is the order with the earliest order date that the customer made. 
It is guaranteed that a customer has precisely one first order.

Write a solution to find the percentage of immediate orders in the first orders of all customers, 
rounded to 2 decimal places.

The result format is in the following example.

Output: 
+----------------------+
| immediate_percentage |
+----------------------+
| 50.00                |
+----------------------+
Explanation: 
The customer id 1 has a first order with delivery id 1 and it is scheduled.
The customer id 2 has a first order with delivery id 2 and it is immediate.
The customer id 3 has a first order with delivery id 5 and it is scheduled.
The customer id 4 has a first order with delivery id 7 and it is immediate.
Hence, half the customers have immediate first orders.
''';
----------------------------- My Solution: ------------------------------
-- Write your MySQL query statement below
WITH first_order_date AS(
    SELECT customer_id,
        MIN(order_date) as first_order_date
    FROM Q1174.Delivery
    GROUP BY customer_id
),
filteredDelivery AS(
    SELECT f.customer_id,
        f.first_order_date,
        d.customer_pref_delivery_date as pref_date
    FROM first_order_date AS f
        INNER JOIN Q1174.Delivery AS d ON d.customer_id = f.customer_id
        AND d.order_date = f.first_order_date
),
Counter AS (
    SELECT f.*,
        CASE
            WHEN f.first_order_date = f.pref_date THEN 1
            ELSE 0
        END AS counter
    FROM filteredDelivery AS f
)
SELECT ROUND(AVG(counter) * 100, 2) AS immediate_percentage
FROM Counter;
----------------------------- frederikmuller Solution: -------------
-- Write your MySQL query statement below