-- Difficulty : Easy
-- Link to Leetcode Problem : https://leetcode.com/problems/user-activity-for-the-past-30-days-i/
CREATE SCHEMA Q1141 AUTHORIZATION username;
-- Creating Tables for Question:
CREATE TYPE activity_type_enum as ENUM(
    'open_session',
    'end_session',
    'scroll_down',
    'send_message'
);
CREATE TABLE IF NOT EXISTS Q1141.Activity(
    user_id INT,
    session_id INT,
    activity_date DATE,
    activity_type activity_type_enum
);
--------------------------------------------------------------------------
------------------------ Loading datas to tables: ------------------------
------------------------ TABLE : Person ------------------------
INSERT INTO Q1141.Activity(
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
INSERT INTO Q1141.Activity(
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
INSERT INTO Q1141.Activity(
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
INSERT INTO Q1141.Activity(
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
INSERT INTO Q1141.Activity(
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
INSERT INTO Q1141.Activity(
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
INSERT INTO Q1141.Activity(
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
INSERT INTO Q1141.Activity(
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
INSERT INTO Q1141.Activity(
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
INSERT INTO Q1141.Activity(
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
INSERT INTO Q1141.Activity(
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
FROM Q1141.Activity;
--------------------------------------------------------------------------
--------------------------------------------------------------------------
--------------------------------------------------------------------------
-------------------------- Problem Desciption: ---------------------------
'''

Write a solution to find the daily active user count for a period of 30 days ending 2019-07-27 inclusively. 
A user was active on someday if they made at least one activity on that day.

Return the result table in any order.

The result format is in the following example.

Output: 
+------------+--------------+ 
| day        | active_users |
+------------+--------------+ 
| 2019-07-20 | 2            |
| 2019-07-21 | 2            |
+------------+--------------+ 
Explanation: Note that we do not care about days with zero active users.
''';
----------------------------- My Solution: ------------------------------
-- Write your MySQL query statement below
SELECT a.activity_date AS day,
    COUNT(DISTINCT a.user_id) AS active_users
FROM Q1141.Activity AS a
GROUP BY a.activity_date
HAVING a.activity_date BETWEEN '2019-06-28' AND '2019-07-27';
----------------------------- frederikmuller Solution: -------------
-- Write your MySQL query statement below