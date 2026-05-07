-- Difficulty : Easy
-- Link to Leetcode Problem : https://leetcode.com/problems/trips-and-users/
-- dfaisal solution : https://www.dsfaisal.com/articles/sql/leetcode-sql-problem-solving#574-winning-candidate--medium---leetcode
-- EverydayDataScience Video Solution : https://www.youtube.com/watch?v=b3LphTjCZ8o
CREATE SCHEMA Q597 AUTHORIZATION username;
-- Creating Tables for Question:
CREATE TABLE IF NOT EXISTS Q597.friend_request(
    sender_id INT,
    send_to_id INT,
    request_date DATE
);
CREATE TABLE IF NOT EXISTS Q597.request_accepted(
    requester_id INT,
    accepter_id INT,
    accept_date DATE
);
--------------------------------------------------------------------------
------------------------ Loading datas to tables: ------------------------
------------------------ TABLE : Person ------------------------
INSERT INTO Q597.friend_request(sender_id, send_to_id, request_date)
VALUES(1, 2, '2016-06-01');
INSERT INTO Q597.friend_request(sender_id, send_to_id, request_date)
VALUES(1, 3, '2016-06-01');
INSERT INTO Q597.friend_request(sender_id, send_to_id, request_date)
VALUES(1, 4, '2016-06-01');
INSERT INTO Q597.friend_request(sender_id, send_to_id, request_date)
VALUES(2, 3, '2016-06-02');
INSERT INTO Q597.friend_request(sender_id, send_to_id, request_date)
VALUES(3, 4, '2016-06-09');
------------------------ TABLE : Address ------------------------
INSERT INTO Q597.request_accepted(requester_id, accepter_id, accept_date)
VALUES(1, 2, '2016-06-03');
INSERT INTO Q597.request_accepted(requester_id, accepter_id, accept_date)
VALUES(1, 3, '2016-06-08');
INSERT INTO Q597.request_accepted(requester_id, accepter_id, accept_date)
VALUES(2, 3, '2016-06-08');
INSERT INTO Q597.request_accepted(requester_id, accepter_id, accept_date)
VALUES(3, 4, '2016-06-09');
INSERT INTO Q597.request_accepted(requester_id, accepter_id, accept_date)
VALUES(3, 4, '2016-06-10');
--------------------------------------------------------------------------
------------------------ CHECK TABLES ------------------------
SELECT *
FROM Q597.friend_request;
---
SELECT *
FROM Q597.request_accepted;
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