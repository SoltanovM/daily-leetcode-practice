-- Difficulty : Easy
-- Link to Leetcode Problem : https://leetcode.com/problems/trips-and-users/
-- dfaisal solution : https://www.dsfaisal.com/articles/sql/leetcode-sql-problem-solving#574-winning-candidate--medium---leetcode
-- EverydayDataScience Video Solution : https://www.youtube.com/watch?v=b3LphTjCZ8o
CREATE SCHEMA Q1126 AUTHORIZATION username;
-- Creating Tables for Question:
CREATE TABLE IF NOT EXISTS Q1126.Events(
    business_id INT,
    event_type VARCHAR,
    occurences INT
);
--------------------------------------------------------------------------
------------------------ Loading datas to tables: ------------------------
------------------------ TABLE : Person ------------------------
INSERT INTO Q1126.Events(business_id, event_type, occurences)
VALUES(1, 'reviews', 7);
INSERT INTO Q1126.Events(business_id, event_type, occurences)
VALUES(3, 'reviews', 3);
INSERT INTO Q1126.Events(business_id, event_type, occurences)
VALUES(1, 'ads', 11);
INSERT INTO Q1126.Events(business_id, event_type, occurences)
VALUES(2, 'ads', 7);
INSERT INTO Q1126.Events(business_id, event_type, occurences)
VALUES(3, 'ads', 6);
INSERT INTO Q1126.Events(business_id, event_type, occurences)
VALUES(1, 'page views', 3);
INSERT INTO Q1126.Events(business_id, event_type, occurences)
VALUES(2, 'page views', 12);
--------------------------------------------------------------------------
------------------------ CHECK TABLES ------------------------
SELECT *
FROM Q1126.Events;
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