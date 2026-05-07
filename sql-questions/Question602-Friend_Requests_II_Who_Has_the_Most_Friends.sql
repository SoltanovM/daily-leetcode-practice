-- Difficulty : Easy
-- Link to Leetcode Problem : https://leetcode.com/problems/trips-and-users/
-- dfaisal solution : https://www.dsfaisal.com/articles/sql/leetcode-sql-problem-solving#574-winning-candidate--medium---leetcode
-- EverydayDataScience Video Solution : https://www.youtube.com/watch?v=b3LphTjCZ8o
CREATE SCHEMA Q602 AUTHORIZATION username;
-- Creating Tables for Question:
CREATE TABLE IF NOT EXISTS Q602.request_accepted(
    requester_id INT,
    accepter_id INT,
    accept_date DATE
);
--------------------------------------------------------------------------
------------------------ Loading datas to tables: ------------------------
------------------------ TABLE : Person ------------------------
INSERT INTO Q602.request_accepted(requester_id, accepter_id, accept_date)
VALUES(1, 2, '2016-06-03');
INSERT INTO Q602.request_accepted(requester_id, accepter_id, accept_date)
VALUES(1, 3, '2016-06-08');
INSERT INTO Q602.request_accepted(requester_id, accepter_id, accept_date)
VALUES(2, 3, '2016-06-08');
INSERT INTO Q602.request_accepted(requester_id, accepter_id, accept_date)
VALUES(3, 4, '2016-06-09');
--------------------------------------------------------------------------
------------------------ CHECK TABLES ------------------------
SELECT *
FROM Q602.request_accepted;
--------------------------------------------------------------------------
--------------------------------------------------------------------------
--------------------------------------------------------------------------
-------------------------- Problem Desciption: ---------------------------
'''

Write a solution to find the people who have the most friends and the most friends number.

The test cases are generated so that only one person has the most friends.

The result format is in the following example.

Output: 
+----+-----+
| id | num |
+----+-----+
| 3  | 3   |
+----+-----+
Explanation: 
The person with id 3 is a friend of people 1, 2, and 4, so he has three friends in total, which is the most number than any others.
''';
----------------------------- My Solution: ------------------------------
-- Write your MySQL query statement below
WITH combinedTable AS (
    SELECT r.requester_id AS id
    FROM Q602.request_accepted AS r
    UNION ALL
    SELECT r.accepter_id AS id
    FROM Q602.request_accepted AS r
)
SELECT id,
    Count(id) AS num
FROM combinedTable
GROUP BY id
ORDER BY Count(id) DESC
LIMIT 1;
----------------------------- frederikmuller Solution: -------------
-- Write your MySQL query statement below