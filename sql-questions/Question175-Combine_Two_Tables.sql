-- Difficulty : Easy
-- Link to Leetcode Problem : https://leetcode.com/problems/combine-two-tables/
-- EverydayDataScience Video Solution : https://www.youtube.com/watch?v=_YYq82ov7Ic&list=PLtfxzVLWb-B-O3VAjxsoZYgG6d8WMnPjG
CREATE SCHEMA Q175 AUTHORIZATION username;
-- Creating Tables for Question:
CREATE TABLE IF NOT EXISTS Q175.Person(
    personId INT PRIMARY KEY,
    lastName VARCHAR,
    firstName VARCHAR
);
CREATE TABLE IF NOT EXISTS Q175.Address(
    addressId INT PRIMARY KEY,
    -- personId INT REFERENCES Q175.Person(personId),
    personId INT,
    city VARCHAR,
    state VARCHAR
);
--------------------------------------------------------------------------
------------------------ Loading datas to tables: ------------------------
------------------------ TABLE : Person ------------------------
INSERT INTO Q175.Person(personId, lastName, firstName)
VALUES(1, 'Wang', 'Allen');
INSERT INTO Q175.Person(personId, lastName, firstName)
VALUES(2, 'Alice', 'Bob');
------------------------ TABLE : Address ------------------------
INSERT INTO Q175.Address(addressId, personId, city, state)
VALUES(1, 2, 'New York City', 'New York');
INSERT INTO Q175.Address(addressId, personId, city, state)
VALUES(2, 3, 'Leetcode', 'California');
--------------------------------------------------------------------------
------------------------ CHECK TABLES ------------------------
SELECT *
FROM Q175.Person;
---
SELECT *
FROM Q175.Address;
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
SELECT
    p.firstname,
    p.lastname,
    a.city,
    a.state
FROM Q175.Person as p
    LEFT JOIN Q175.Address as a ON p.personid = a.personid;
