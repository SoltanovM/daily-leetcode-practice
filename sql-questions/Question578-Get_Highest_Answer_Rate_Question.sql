-- Difficulty : Easy
-- Link to Leetcode Problem : https://leetcode.com/problems/trips-and-users/
-- dfaisal solution : https://www.dsfaisal.com/articles/sql/leetcode-sql-problem-solving#574-winning-candidate--medium---leetcode
-- EverydayDataScience Video Solution : https://www.youtube.com/watch?v=b3LphTjCZ8o
CREATE TYPE action_enum AS ENUM ('show', 'answer', 'skip');
CREATE SCHEMA Q578 AUTHORIZATION username;
-- Creating Tables for Question:
CREATE TABLE IF NOT EXISTS Q578.survey_log(
    uid INT,
    action action_enum,
    question_id INT,
    answer_id INT,
    q_num INT,
    timestamp INT,
    CONSTRAINT valid_answer_id_for_action CHECK (
        (
            action = 'answer'
            AND answer_id IS NOT NULL
        )
        OR (
            action IN ('show', 'skip')
            AND answer_id IS NULL
        )
    )
);
-- DROP TABLE Q578.survey_log
--------------------------------------------------------------------------
------------------------ Loading datas to tables: ------------------------
------------------------ TABLE : survey_log ------------------------
INSERT INTO Q578.survey_log(
        uid,
        action,
        question_id,
        answer_id,
        q_num,
        timestamp
    )
VALUES(
        5,
        'show',
        285,
        null,
        1,
        123
    );
INSERT INTO Q578.survey_log(
        uid,
        action,
        question_id,
        answer_id,
        q_num,
        timestamp
    )
VALUES(
        5,
        'answer',
        285,
        124124,
        1,
        124
    );
INSERT INTO Q578.survey_log(
        uid,
        action,
        question_id,
        answer_id,
        q_num,
        timestamp
    )
VALUES(
        5,
        'show',
        369,
        null,
        2,
        125
    );
INSERT INTO Q578.survey_log(
        uid,
        action,
        question_id,
        answer_id,
        q_num,
        timestamp
    )
VALUES(
        5,
        'skip',
        369,
        null,
        2,
        126
    );
--------------------------------------------------------------------------
------------------------ CHECK TABLES ------------------------
SELECT *
FROM Q578.survey_log;
--------------------------------------------------------------------------
--------------------------------------------------------------------------
--------------------------------------------------------------------------
-------------------------- Problem Desciption: ---------------------------
'''
Get the highest answer rate question from a table survey_log with these columns: uid, action, question_id, answer_id, q_num, timestamp.

uid means user id; action has these kind of values: “show”, “answer”, “skip”; answer_id is not null when action column is “answer”, while is null for “show” and “skip”; q_num is the numeral order of the question in current session.

Write a sql query to identify the question which has the highest answer rate.

Explanation: question 285 has answer rate 1/1, while question 369 has 0/1 answer rate, so output 285.

Note: The highest answer rate meaning is: answer number’s ratio in show number in the same question.
''';
----------------------------- My Solution: ------------------------------
-- Write your MySQL query statement below
----------------------------- frederikmuller Solution: -------------
-- Write your MySQL query statement below