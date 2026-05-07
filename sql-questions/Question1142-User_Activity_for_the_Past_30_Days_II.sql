-- Difficulty : Easy
-- Link to Leetcode Problem : https://leetcode.com/problems/trips-and-users/
-- dfaisal solution : https://www.dsfaisal.com/articles/sql/leetcode-sql-problem-solving#574-winning-candidate--medium---leetcode
-- EverydayDataScience Video Solution : https://www.youtube.com/watch?v=b3LphTjCZ8o
CREATE SCHEMA Q1142 AUTHORIZATION username;
-- Creating Tables for Question:
CREATE TYPE activity_type_enum as ENUM(
    'open_session',
    'end_session',
    'scroll_down',
    'send_message'
);
CREATE TABLE IF NOT EXISTS Q1142.Activity(
    user_id INT,
    session_id INT,
    activity_date DATE,
    activity_type activity_type_enum
);
--------------------------------------------------------------------------
------------------------ Loading datas to tables: ------------------------
------------------------ TABLE : Person ------------------------
INSERT INTO Q1142.Activity(
        user_id,
        session_id,
        activity_date,
        activity_type
    )
VALUES(
        1,
        1,
        '2019-07-20',
        'open_session'
    );
INSERT INTO Q1142.Activity(
        user_id,
        session_id,
        activity_date,
        activity_type
    )
VALUES(
        1,
        1,
        '2019-07-20',
        'scroll_down'
    );
INSERT INTO Q1142.Activity(
        user_id,
        session_id,
        activity_date,
        activity_type
    )
VALUES(
        1,
        1,
        '2019-07-20',
        'end_session'
    );
INSERT INTO Q1142.Activity(
        user_id,
        session_id,
        activity_date,
        activity_type
    )
VALUES(
        2,
        4,
        '2019-07-20',
        'open_session'
    );
INSERT INTO Q1142.Activity(
        user_id,
        session_id,
        activity_date,
        activity_type
    )
VALUES(
        2,
        4,
        '2019-07-21',
        'send_message'
    );
INSERT INTO Q1142.Activity(
        user_id,
        session_id,
        activity_date,
        activity_type
    )
VALUES(
        2,
        4,
        '2019-07-21',
        'end_session'
    );
INSERT INTO Q1142.Activity(
        user_id,
        session_id,
        activity_date,
        activity_type
    )
VALUES(
        3,
        2,
        '2019-07-21',
        'open_session'
    );
INSERT INTO Q1142.Activity(
        user_id,
        session_id,
        activity_date,
        activity_type
    )
VALUES(
        3,
        2,
        '2019-07-21',
        'send_message'
    );
INSERT INTO Q1142.Activity(
        user_id,
        session_id,
        activity_date,
        activity_type
    )
VALUES(
        3,
        2,
        '2019-07-21',
        'end_session'
    );
INSERT INTO Q1142.Activity(
        user_id,
        session_id,
        activity_date,
        activity_type
    )
VALUES(
        4,
        3,
        '2019-06-25',
        'open_session'
    );
INSERT INTO Q1142.Activity(
        user_id,
        session_id,
        activity_date,
        activity_type
    )
VALUES(
        4,
        3,
        '2019-06-25',
        'end_session'
    );
--------------------------------------------------------------------------
------------------------ CHECK TABLES ------------------------
SELECT *
FROM Q1142.Activity;
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