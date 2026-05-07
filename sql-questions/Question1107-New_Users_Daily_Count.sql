-- Difficulty : Easy
-- Link to Leetcode Problem : https://leetcode.com/problems/trips-and-users/
-- dfaisal solution : https://www.dsfaisal.com/articles/sql/leetcode-sql-problem-solving#574-winning-candidate--medium---leetcode
-- EverydayDataScience Video Solution : https://www.youtube.com/watch?v=b3LphTjCZ8o
CREATE TYPE activity_enum AS ENUM(
    'login',
    'logout',
    'jobs',
    'groups',
    'homepage'
);
CREATE SCHEMA Q1107 AUTHORIZATION username;
-- Creating Tables for Question:
CREATE TABLE IF NOT EXISTS Q1107.Traffic(
    user_id INT,
    activity activity_enum,
    activity_date DATE
);
--------------------------------------------------------------------------
------------------------ Loading datas to tables: ------------------------
------------------------ TABLE : Person ------------------------
INSERT INTO Q1107.Traffic(user_id, activity, activity_date)
VALUES(1, 'login', '2019-05-01');
INSERT INTO Q1107.Traffic(user_id, activity, activity_date)
VALUES(1, 'homepage', '2019-05-01');
INSERT INTO Q1107.Traffic(user_id, activity, activity_date)
VALUES(1, 'logout', '2019-05-01');
INSERT INTO Q1107.Traffic(user_id, activity, activity_date)
VALUES(2, 'login', '2019-06-21');
INSERT INTO Q1107.Traffic(user_id, activity, activity_date)
VALUES(2, 'logout', '2019-06-21');
INSERT INTO Q1107.Traffic(user_id, activity, activity_date)
VALUES(3, 'login', '2019-01-01');
INSERT INTO Q1107.Traffic(user_id, activity, activity_date)
VALUES(3, 'jobs', '2019-01-01');
INSERT INTO Q1107.Traffic(user_id, activity, activity_date)
VALUES(3, 'logout', '2019-01-01');
INSERT INTO Q1107.Traffic(user_id, activity, activity_date)
VALUES(4, 'login', '2019-06-21');
INSERT INTO Q1107.Traffic(user_id, activity, activity_date)
VALUES(4, 'groups', '2019-06-21');
INSERT INTO Q1107.Traffic(user_id, activity, activity_date)
VALUES(4, 'logout', '2019-06-21');
INSERT INTO Q1107.Traffic(user_id, activity, activity_date)
VALUES(5, 'login', '2019-03-01');
INSERT INTO Q1107.Traffic(user_id, activity, activity_date)
VALUES(5, 'logout', '2019-03-01');
INSERT INTO Q1107.Traffic(user_id, activity, activity_date)
VALUES(5, 'login', '2019-06-21');
INSERT INTO Q1107.Traffic(user_id, activity, activity_date)
VALUES(5, 'logout', '2019-06-21');
--------------------------------------------------------------------------
------------------------ CHECK TABLES ------------------------
SELECT *
FROM Q1107.Traffic;
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