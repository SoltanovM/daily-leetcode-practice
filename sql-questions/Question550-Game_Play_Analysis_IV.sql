-- Difficulty : Easy
-- Link to Leetcode Problem : https://leetcode.com/problems/trips-and-users/
-- dfaisal solution : https://www.dsfaisal.com/articles/sql/leetcode-sql-problem-solving#574-winning-candidate--medium---leetcode
-- EverydayDataScience Video Solution : https://www.youtube.com/watch?v=b3LphTjCZ8o
CREATE SCHEMA Q550 AUTHORIZATION username;
-- Creating Tables for Question:
CREATE TABLE IF NOT EXISTS Q550.Activity(
    player_id INT,
    device_id INT,
    event_date DATE,
    games_played INT
);
--------------------------------------------------------------------------
------------------------ Loading datas to tables: ------------------------
------------------------ TABLE : Activity ------------------------
INSERT INTO Q550.Activity(player_id, device_id, event_date, games_played)
VALUES(1, 2, '2016-03-01', 5);
INSERT INTO Q550.Activity(player_id, device_id, event_date, games_played)
VALUES(1, 2, '2016-03-02', 6);
INSERT INTO Q550.Activity(player_id, device_id, event_date, games_played)
VALUES(2, 3, '2017-06-25', 1);
INSERT INTO Q550.Activity(player_id, device_id, event_date, games_played)
VALUES(3, 1, '2016-03-02', 0);
INSERT INTO Q550.Activity(player_id, device_id, event_date, games_played)
VALUES(3, 4, '2018-07-03', 5);
--------------------------------------------------------------------------
------------------------ CHECK TABLES ------------------------
SELECT *
FROM Q550.Activity;
-- DELETE FROM Q550.Activity;
--------------------------------------------------------------------------
--------------------------------------------------------------------------
--------------------------------------------------------------------------
-------------------------- Problem Desciption: ---------------------------
'''
Write an SQL query that reports the fraction of players that logged in again on the day after the day they 
first logged in, rounded to 2 decimal places. In other words, you need to count the number of players that 
logged in for at least two consecutive days starting from their first login date, then divide that 
number by the total number of players.

Result table:
+-----------+
| fraction  |
+-----------+
| 0.33      |
+-----------+
Only the player with id 1 logged back in after the first day he had logged in so the answer is 1/3 = 0.33

''';
----------------------------- My Solution: ------------------------------
WITH tempTable2 AS (
    WITH tempTable AS (
        SELECT t1.player_id,
            t1.event_date,
            t2.first_event
        FROM Q550.Activity t1
            JOIN (
                SELECT player_id,
                    MIN(event_date) AS first_event
                FROM Q550.Activity
                GROUP BY player_id
            ) t2 ON t1.player_id = t2.player_id
    )
    SELECT CASE
            WHEN tt.event_date = tt.first_event + INTERVAL '1 day' THEN 1
            ELSE 0
        END AS counter,
        tt.player_id,
        tt.event_date,
        tt.first_event
    FROM tempTable AS tt
)
SELECT ROUND(
        (
            sum(tt2.counter) * 1.0 / COUNT(DISTINCT tt2.player_id)
        ),
        2
    ) AS fraction
FROM tempTable2 AS tt2;
-- #Solution- 1:
SELECT ROUND(
        sum(
            CASE
                WHEN t1.event_date = t2.first_event + 1 THEN 1
                ELSE 0
            END
        ) / COUNT(DISTINCT t1.player_id),
        2
    ) AS fraction
SELECT *
FROM Q550.Activity t1
    JOIN (
        SELECT player_id,
            MIN(event_date) AS first_event
        FROM Q550.Activity
        GROUP BY player_id
    ) t2 ON t1.player_id = t2.player_id
WHERE t1.event_date = t2.first_event + 1;
-------------------------------------------------
-- #Solution- 2:
SELECT ROUND(
        COUNT(DISTINCT b.player_id) / COUNT(DISTINCT a.player_id),
        2
    ) AS fraction
FROM (
        SELECT player_id,
            MIN(event_date) AS event_date
        FROM Q550.Activity
        GROUP BY player_id
    ) a
    LEFT JOIN Q550.Activity b ON a.player_id = b.player_id
    AND a.event_date + 1 = b.event_date;
-- Write your MySQL query statement below
----------------------------- frederikmuller Solution: -------------
-- Write your MySQL query statement below