-- Difficulty : Easy
-- Link to Leetcode Problem : https://leetcode.com/problems/trips-and-users/
-- dfaisal solution : https://www.dsfaisal.com/articles/sql/leetcode-sql-problem-solving#574-winning-candidate--medium---leetcode
-- EverydayDataScience Video Solution : https://www.youtube.com/watch?v=b3LphTjCZ8o
CREATE SCHEMA Q603 AUTHORIZATION username;
-- Creating Tables for Question:
CREATE TABLE IF NOT EXISTS Q603.cinema(seat_id INT PRIMARY KEY, free INT);
--------------------------------------------------------------------------
------------------------ Loading datas to tables: ------------------------
------------------------ TABLE : Person ------------------------
INSERT INTO Q603.cinema(seat_id, free)
VALUES(1, 1);
INSERT INTO Q603.cinema(seat_id, free)
VALUES(2, 0);
INSERT INTO Q603.cinema(seat_id, free)
VALUES(3, 1);
INSERT INTO Q603.cinema(seat_id, free)
VALUES(4, 1);
INSERT INTO Q603.cinema(seat_id, free)
VALUES(5, 1);
--------------------------------------------------------------------------
------------------------ CHECK TABLES ------------------------
SELECT *
FROM Q603.cinema;
--------------------------------------------------------------------------
--------------------------------------------------------------------------
--------------------------------------------------------------------------
-------------------------- Problem Desciption: ---------------------------
'''
Several friends at a cinema ticket office would like to reserve consecutive available seats. 
Can you help to query all the consecutive available seats order by the seat_id using the following cinema table?

Note:

The seat_id is an auto increment int, and free is bool (‘1’ means free, and ‘0’ means occupied.). 
Consecutive available seats are more than 2(inclusive) seats consecutively available.
''';
----------------------------- My Solution: ------------------------------
-- Write your MySQL query statement below
----------------------------- frederikmuller Solution: -------------
-- Write your MySQL query statement below