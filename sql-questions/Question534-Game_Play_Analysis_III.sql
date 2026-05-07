-- Difficulty : Easy
-- Link to Leetcode Problem : https://leetcode.com/problems/trips-and-users/
-- dfaisal solution : https://www.dsfaisal.com/articles/sql/leetcode-sql-problem-solving#574-winning-candidate--medium---leetcode
-- EverydayDataScience Video Solution : https://www.youtube.com/watch?v=b3LphTjCZ8o
CREATE SCHEMA Q534 AUTHORIZATION username;
-- Creating Tables for Question:
CREATE TABLE IF NOT EXISTS Q534.Activity(
    player_id INT,
    device_id INT,
    event_date DATE,
    games_played INT
);
--------------------------------------------------------------------------
------------------------ Loading datas to tables: ------------------------
------------------------ TABLE : Activity ------------------------
INSERT INTO Q534.Activity(player_id, device_id, event_date, games_played)
VALUES(1, 2, '2016-03-01', 5);
INSERT INTO Q534.Activity(player_id, device_id, event_date, games_played)
VALUES(1, 2, '2016-05-02', 6);
INSERT INTO Q534.Activity(player_id, device_id, event_date, games_played)
VALUES(2, 3, '2017-06-25', 1);
INSERT INTO Q534.Activity(player_id, device_id, event_date, games_played)
VALUES(3, 1, '2016-03-02', 0);
INSERT INTO Q534.Activity(player_id, device_id, event_date, games_played)
VALUES(3, 4, '2018-07-03', 5);
--------------------------------------------------------------------------
------------------------ CHECK TABLES ------------------------
SELECT *
FROM Q534.Activity;
--------------------------------------------------------------------------
--------------------------------------------------------------------------
--------------------------------------------------------------------------
-------------------------- Problem Desciption: ---------------------------
'''
Write an SQL query that reports for each player and date, how many games played so far by the player. 
That is, the total number of games played by the player until that date. 
Check the example for clarity.

Result table:
+-----------+------------+---------------------+
| player_id | event_date | games_played_so_far |
+-----------+------------+---------------------+
| 1         | 2016-03-01 | 5                   |
| 1         | 2016-05-02 | 11                  |
| 1         | 2017-06-25 | 12                  |
| 3         | 2016-03-02 | 0                   |
| 3         | 2018-07-03 | 5                   |
+-----------+------------+---------------------+
For the player with id 1, 5 + 6 = 11 games played by 2016-05-02, and 5 + 6 + 1 = 12 games played by 2017-06-25.
For the player with id 3, 0 + 5 = 5 games played by 2018-07-03.
Note that for each player we only care about the days when the player logged in.

''';
----------------------------- My Solution: ------------------------------
-- # Write your MySQL query statement below
--#Solution- 1:
SELECT t1.player_id,
    t1.event_date,
    SUM(t2.games_played) as games_played_so_far
FROM Q534.Activity t1
    JOIN Q534.Activity t2 ON t1.player_id = t2.player_id
WHERE t1.event_date >= t2.event_date
GROUP BY t1.player_id,
    t1.event_date;
-- #Solution- 2:
SELECT player_id,
    event_date,
    SUM(games_played) OVER (
        PARTITION BY player_id
        ORDER BY event_date
    ) AS games_played_so_far
FROM Q534.Activity;
----------------------------- frederikmuller Solution: -------------
-- Write your MySQL query statement below