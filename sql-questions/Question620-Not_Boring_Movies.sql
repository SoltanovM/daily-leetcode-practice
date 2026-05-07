-- Difficulty : Easy
-- Link to Leetcode Problem : https://leetcode.com/problems/trips-and-users/
-- dfaisal solution : https://www.dsfaisal.com/articles/sql/leetcode-sql-problem-solving#574-winning-candidate--medium---leetcode
-- EverydayDataScience Video Solution : https://www.youtube.com/watch?v=b3LphTjCZ8o
CREATE SCHEMA Q620 AUTHORIZATION username;
-- Creating Tables for Question:
CREATE TABLE IF NOT EXISTS Q620.cinema(
    id INT PRIMARY KEY,
    movie VARCHAR,
    description VARCHAR,
    rating DECIMAL
);
--------------------------------------------------------------------------
------------------------ Loading datas to tables: ------------------------
------------------------ TABLE : Person ------------------------
INSERT INTO Q620.cinema(id, movie, description, rating)
VALUES(
        1,
        'War',
        'great 3D',
        8.9
    );
INSERT INTO Q620.cinema(id, movie, description, rating)
VALUES(
        2,
        'Science',
        'fiction',
        8.5
    );
INSERT INTO Q620.cinema(id, movie, description, rating)
VALUES(
        3,
        'irish',
        'boring',
        6.2
    );
INSERT INTO Q620.cinema(id, movie, description, rating)
VALUES(
        4,
        'Ice song',
        'Fantacy',
        8.6
    );
INSERT INTO Q620.cinema(id, movie, description, rating)
VALUES(5, 'House card', 'Interesting', 9.1);
--------------------------------------------------------------------------
------------------------ CHECK TABLES ------------------------
SELECT *
FROM Q620.cinema;
--------------------------------------------------------------------------
--------------------------------------------------------------------------
--------------------------------------------------------------------------
-------------------------- Problem Desciption: ---------------------------
'''
Write a solution to report the movies with an odd-numbered ID and a description that is not "boring".

Return the result table ordered by rating in descending order.

The result format is in the following example.

Output: 
+----+------------+-------------+--------+
| id | movie      | description | rating |
+----+------------+-------------+--------+
| 5  | House card | Interesting | 9.1    |
| 1  | War        | great 3D    | 8.9    |
+----+------------+-------------+--------+
Explanation: 
We have three movies with odd-numbered IDs: 1, 3, and 5. The movie with ID = 3 is boring so we do not include it in the answer.
''';
----------------------------- My Solution: ------------------------------
-- Write your MySQL query statement below
SELECT *
FROM Q620.cinema
WHERE id %2 = 1
    AND description != 'boring'
ORDER BY rating DESC;
----------------------------- frederikmuller Solution: -------------
-- Write your MySQL query statement below