-- Difficulty : Easy
-- Link to Leetcode Problem : https://leetcode.com/problems/trips-and-users/
-- dfaisal solution : https://www.dsfaisal.com/articles/sql/leetcode-sql-problem-solving#574-winning-candidate--medium---leetcode
-- EverydayDataScience Video Solution : https://www.youtube.com/watch?v=b3LphTjCZ8o
CREATE SCHEMA Q1132 AUTHORIZATION username;
CREATE TYPE action_enum_2 AS ENUM(
    'view',
    'like',
    'reaction',
    'comment',
    'report',
    'share'
);
-- Creating Tables for Question:
CREATE TABLE IF NOT EXISTS Q1132.Actions(
    user_id INT,
    post_id INT,
    action_date DATE,
    action action_enum_2,
    extra VARCHAR
);
--------------------------------------------------------------------------
------------------------ Loading datas to tables: ------------------------
------------------------ TABLE : Person ------------------------
INSERT INTO Q1132.Actions(user_id, post_id, action_date, action, extra)
VALUES(
        1,
        1,
        '2019-07-01',
        'view',
        null
    );
INSERT INTO Q1132.Actions(user_id, post_id, action_date, action, extra)
VALUES(
        1,
        1,
        '2019-07-01',
        'like',
        null
    );
INSERT INTO Q1132.Actions(user_id, post_id, action_date, action, extra)
VALUES(
        1,
        1,
        '2019-07-01',
        'share',
        null
    );
INSERT INTO Q1132.Actions(user_id, post_id, action_date, action, extra)
VALUES(
        2,
        4,
        '2019-07-04',
        'view',
        null
    );
INSERT INTO Q1132.Actions(user_id, post_id, action_date, action, extra)
VALUES(
        2,
        4,
        '2019-07-04',
        'report',
        'spam'
    );
INSERT INTO Q1132.Actions(user_id, post_id, action_date, action, extra)
VALUES(
        3,
        4,
        '2019-07-04',
        'view',
        null
    );
INSERT INTO Q1132.Actions(user_id, post_id, action_date, action, extra)
VALUES(
        3,
        4,
        '2019-07-04',
        'report',
        'spam'
    );
INSERT INTO Q1132.Actions(user_id, post_id, action_date, action, extra)
VALUES(
        4,
        3,
        '2019-07-02',
        'view',
        null
    );
INSERT INTO Q1132.Actions(user_id, post_id, action_date, action, extra)
VALUES(
        4,
        3,
        '2019-07-02',
        'report',
        'spam'
    );
INSERT INTO Q1132.Actions(user_id, post_id, action_date, action, extra)
VALUES(
        5,
        2,
        '2019-07-04',
        'view',
        null
    );
INSERT INTO Q1132.Actions(user_id, post_id, action_date, action, extra)
VALUES(
        5,
        2,
        '2019-07-04',
        'report',
        'racism'
    );
INSERT INTO Q1132.Actions(user_id, post_id, action_date, action, extra)
VALUES(
        5,
        5,
        '2019-07-04',
        'view',
        null
    );
INSERT INTO Q1132.Actions(user_id, post_id, action_date, action, extra)
VALUES(
        5,
        5,
        '2019-07-04',
        'report',
        'racism'
    );
--------------------------------------------------------------------------
------------------------ CHECK TABLES ------------------------
SELECT *
FROM Q1132.Actions;
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