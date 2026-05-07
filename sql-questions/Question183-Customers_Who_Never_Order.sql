-- Difficulty : Easy
-- Link to Leetcode Problem : https://leetcode.com/problems/customers-who-never-order/
-- EverydayDataScience Video Solution : https://www.youtube.com/watch?v=ddeiGdMWtbQ
CREATE SCHEMA Q183 AUTHORIZATION username;
-- Creating Tables for Question:
CREATE TABLE IF NOT EXISTS Q183.Customers(Id INT PRIMARY KEY, Name VARCHAR);
CREATE TABLE IF NOT EXISTS Q183.Orders(Id INT PRIMARY KEY, CustomerId INT);
--------------------------------------------------------------------------
------------------------ Loading datas to tables: ------------------------
------------------------ TABLE : Person ------------------------
INSERT INTO Q183.Customers(Id, Name)
VALUES(1, 'Joe');
INSERT INTO Q183.Customers(Id, Name)
VALUES(2, 'Henry');
INSERT INTO Q183.Customers(Id, Name)
VALUES(3, 'Sam');
INSERT INTO Q183.Customers(Id, Name)
VALUES(4, 'Max');
------------------------ TABLE : Address ------------------------
INSERT INTO Q183.Orders(Id, CustomerId)
VALUES(1, 3);
INSERT INTO Q183.Orders(Id, CustomerId)
VALUES(2, 1);
--------------------------------------------------------------------------
------------------------ CHECK TABLES ------------------------
SELECT *
FROM Q183.Customers;
---
SELECT *
FROM Q183.Orders;
--------------------------------------------------------------------------
--------------------------------------------------------------------------
--------------------------------------------------------------------------
-------------------------- Problem Desciption: ---------------------------
'''
Suppose that a website contains two tables, the Customers table and the Orders table. 
Write a SQL query to find all customers who never order anything.

Output: 
+-----------+
| Customers |
+-----------+
| Henry     |
| Max       |
+-----------+

''';
----------------------------- My Solution: ------------------------------
-- Write your MySQL query statement below
SELECT c.name AS Customers
FROM Q183.Customers AS c
    LEFT JOIN Q183.Orders AS o ON c.id = o.customerid
WHERE o.customerid IS NULL;
----------------------------- EverydayDataScience Solution: -------------
-- Write your MySQL query statement below