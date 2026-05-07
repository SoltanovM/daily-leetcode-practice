-- Difficulty : Easy
-- Link to Leetcode Problem : https://leetcode.com/problems/actors-and-directors-who-cooperated-at-least-three-times/
CREATE SCHEMA Q1050 AUTHORIZATION username;
-- Creating Tables for Question:
CREATE TABLE IF NOT EXISTS Q1050.ActorDirector(
    actor_id INT,
    director_id INT,
    timestamp INT PRIMARY KEY
);
--------------------------------------------------------------------------
------------------------ Loading datas to tables: ------------------------
------------------------ TABLE : Person ------------------------
INSERT INTO Q1050.ActorDirector(actor_id, director_id, timestamp)
VALUES(1, 1, 0);
INSERT INTO Q1050.ActorDirector(actor_id, director_id, timestamp)
VALUES(1, 1, 1);
INSERT INTO Q1050.ActorDirector(actor_id, director_id, timestamp)
VALUES(1, 1, 2);
INSERT INTO Q1050.ActorDirector(actor_id, director_id, timestamp)
VALUES(1, 2, 3);
INSERT INTO Q1050.ActorDirector(actor_id, director_id, timestamp)
VALUES(1, 2, 4);
INSERT INTO Q1050.ActorDirector(actor_id, director_id, timestamp)
VALUES(2, 1, 5);
INSERT INTO Q1050.ActorDirector(actor_id, director_id, timestamp)
VALUES(2, 1, 6);
--------------------------------------------------------------------------
------------------------ CHECK TABLES ------------------------
SELECT *
FROM Q1050.ActorDirector;
--------------------------------------------------------------------------
--------------------------------------------------------------------------
--------------------------------------------------------------------------
-------------------------- Problem Desciption: ---------------------------
'''
Write a solution to find all the pairs (actor_id, director_id) where the 
actor has cooperated with the director at least three times.

Return the result table in any order.

The result format is in the following example.

Output: 
+-------------+-------------+
| actor_id    | director_id |
+-------------+-------------+
| 1           | 1           |
+-------------+-------------+
Explanation: The only pair is (1, 1) where they cooperated exactly 3 times.
''';
----------------------------- My Solution: ------------------------------
-- Write your MySQL query statement below
SELECT ad.actor_id,
    ad.director_id
FROM Q1050.ActorDirector AS ad
GROUP BY (ad.actor_id, ad.director_id)
HAVING COUNT((ad.actor_id, ad.director_id)) >= 3;
----------------------------- frederikmuller Solution: -------------
-- Write your MySQL query statement below