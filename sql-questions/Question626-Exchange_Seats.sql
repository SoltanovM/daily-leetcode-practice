-- Difficulty : Easy
-- Link to Leetcode Problem : https://leetcode.com/problems/trips-and-users/
-- dfaisal solution : https://www.dsfaisal.com/articles/sql/leetcode-sql-problem-solving#574-winning-candidate--medium---leetcode
-- EverydayDataScience Video Solution : https://www.youtube.com/watch?v=b3LphTjCZ8o
CREATE SCHEMA Q626 AUTHORIZATION username;
-- Creating Tables for Question:
CREATE TABLE IF NOT EXISTS Q626.seat(id INT PRIMARY KEY, student VARCHAR);
--------------------------------------------------------------------------
------------------------ Loading datas to tables: ------------------------
------------------------ TABLE : Person ------------------------
INSERT INTO Q626.seat(id, student)
VALUES(1, 'Abbot');
INSERT INTO Q626.seat(id, student)
VALUES(2, 'Doris');
INSERT INTO Q626.seat(id, student)
VALUES(3, 'Emerson');
INSERT INTO Q626.seat(id, student)
VALUES(4, 'Green');
INSERT INTO Q626.seat(id, student)
VALUES(5, 'Jeames');
-- INSERT INTO Q626.seat(id, student)
-- VALUES(6, 'Julia');
--------------------------------------------------------------------------
------------------------ CHECK TABLES ------------------------
SELECT *
FROM Q626.seat;
--------------------------------------------------------------------------
--------------------------------------------------------------------------
--------------------------------------------------------------------------
-------------------------- Problem Desciption: ---------------------------
'''
Write a solution to swap the seat id of every two consecutive students. 
If the number of students is odd, the id of the last student is not swapped.

Return the result table ordered by id in ascending order.

The result format is in the following example.

Output: 
+----+---------+
| id | student |
+----+---------+
| 1  | Doris   |
| 2  | Abbot   |
| 3  | Green   |
| 4  | Emerson |
| 5  | Jeames  |
+----+---------+
Explanation: 
Note that if the number of students is odd, there is no need to change the last ones seat.
''';
----------------------------- My Solution: ------------------------------
-- Write your MySQL query statement below
WITH seat_count AS (
    SELECT COUNT(*) AS total_count
    FROM Q626.seat
),
newId AS (
    SELECT id,
        CASE
            WHEN total_count % 2 = 0
            AND id % 2 = 0 THEN id - 1
            WHEN total_count % 2 = 0
            AND id % 2 = 1 THEN id + 1
            WHEN total_count % 2 = 1
            AND id = (
                SELECT MAX(id)
                FROM Q626.seat
            ) THEN id
            WHEN total_count % 2 = 1
            AND id % 2 = 0 THEN id - 1
            WHEN total_count % 2 = 1
            AND id % 2 = 1 THEN id + 1
        END AS newid
    FROM Q626.seat,
        seat_count
    GROUP BY id,
        total_count
)
SELECT n.newid AS id,
    s.student AS student
FROM newId AS n
    INNER JOIN Q626.seat AS s ON n.id = s.id
ORDER BY n.newid ASC;
----------------------------- frederikmuller Solution: -------------
-- Write your MySQL query statement below