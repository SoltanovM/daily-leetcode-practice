-- Difficulty : Easy
-- Link to Leetcode Problem : https://leetcode.com/problems/trips-and-users/
-- dfaisal solution : https://www.dsfaisal.com/articles/sql/leetcode-sql-problem-solving#574-winning-candidate--medium---leetcode
-- EverydayDataScience Video Solution : https://www.youtube.com/watch?v=b3LphTjCZ8o
CREATE SCHEMA Q511 AUTHORIZATION username;
-- Creating Tables for Question:
CREATE TABLE IF NOT EXISTS Q511.Activity(
    player_id INT,
    device_id INT,
    event_date DATE,
    games_played INT
);
--------------------------------------------------------------------------
------------------------ Loading datas to tables: ------------------------
------------------------ TABLE : Activity ------------------------
INSERT INTO Q511.Activity(player_id, device_id, event_date, games_played)
VALUES(1, 2, '2016-03-01', 5);
INSERT INTO Q511.Activity(player_id, device_id, event_date, games_played)
VALUES(1, 2, '2016-05-02', 6);
INSERT INTO Q511.Activity(player_id, device_id, event_date, games_played)
VALUES(2, 3, '2017-06-25', 1);
INSERT INTO Q511.Activity(player_id, device_id, event_date, games_played)
VALUES(3, 1, '2016-03-02', 0);
INSERT INTO Q511.Activity(player_id, device_id, event_date, games_played)
VALUES(3, 4, '2018-07-03', 5);
--------------------------------------------------------------------------
------------------------ CHECK TABLES ------------------------
SELECT *
FROM Q511.Activity;
--------------------------------------------------------------------------
--------------------------------------------------------------------------
--------------------------------------------------------------------------
-------------------------- Problem Desciption: ---------------------------
'''
Write a solution to find the first login date for each player.

Return the result table in any order.

The result format is in the following example.

Output: 
+-----------+-------------+
| player_id | first_login |
+-----------+-------------+
| 1         | 2016-03-01  |
| 2         | 2017-06-25  |
| 3         | 2016-03-02  |
+-----------+-------------+
''';
----------------------------- My Solution: ------------------------------
-- Write your MySQL query statement below
SELECT a.player_id,
    min(a.event_date) AS first_login
FROM Q511.Activity AS a
GROUP BY a.player_id;
----------------------------- frederikmuller Solution: -------------
-- Write your MySQL query statement below