-- Difficulty : Easy
-- Link to Leetcode Problem : https://leetcode.com/problems/trips-and-users/
-- dfaisal solution : https://www.dsfaisal.com/articles/sql/leetcode-sql-problem-solving#574-winning-candidate--medium---leetcode
-- EverydayDataScience Video Solution : https://www.youtube.com/watch?v=b3LphTjCZ8o
CREATE SCHEMA Q586 AUTHORIZATION username;
-- Creating Tables for Question:
CREATE TABLE IF NOT EXISTS Q586.orders(order_number INT, customer_number INT);
--------------------------------------------------------------------------
------------------------ Loading datas to tables: ------------------------
------------------------ TABLE : Person ------------------------
INSERT INTO Q586.orders(order_number, customer_number)
VALUES(3, 5);
INSERT INTO Q586.orders(order_number, customer_number)
VALUES(5, 1);
INSERT INTO Q586.orders(order_number, customer_number)
VALUES(6, 5);
INSERT INTO Q586.orders(order_number, customer_number)
VALUES(8, 6);
INSERT INTO Q586.orders(order_number, customer_number)
VALUES(9, 2);
INSERT INTO Q586.orders(order_number, customer_number)
VALUES(7, 4);
INSERT INTO Q586.orders(order_number, customer_number)
VALUES(10, 4);
INSERT INTO Q586.orders(order_number, customer_number)
VALUES(11, 16);
INSERT INTO Q586.orders(order_number, customer_number)
VALUES(12, 3);
INSERT INTO Q586.orders(order_number, customer_number)
VALUES(13, 5);
INSERT INTO Q586.orders(order_number, customer_number)
VALUES(14, 3);
INSERT INTO Q586.orders(order_number, customer_number)
VALUES(15, 16);
--------------------------------------------------------------------------
------------------------ CHECK TABLES ------------------------
SELECT *
FROM Q586.orders;
-- DROP  TABLE  Q586.orders;0
--------------------------------------------------------------------------
--------------------------------------------------------------------------
--------------------------------------------------------------------------
-------------------------- Problem Desciption: ---------------------------
'''
Write a solution to find the customer_number for the customer who has placed the largest number of orders.

The test cases are generated so that exactly one customer will have placed more orders than any other customer.

The result format is in the following example.


Output: 
+-----------------+
| customer_number |
+-----------------+
| 3               |
+-----------------+
Explanation: 
The customer with number 3 has two orders, which is greater than either customer 1 or 2 because each of them only has one order. 
So the result is customer_number 3.
''';
----------------------------- My Solution: ------------------------------
-- Write your MySQL query statement below
SELECT customer_number
FROM Q586.orders
WHERE order_number = (
        SELECT MAX(order_number)
        FROM Q586.orders
    );
----------------------------- frederikmuller Solution: -------------
SELECT customer_number
FROM orders
GROUP BY customer_number
ORDER BY COUNT(1) DESC
LIMIT 1