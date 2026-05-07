-- Difficulty : Easy
-- Link to Leetcode Problem : https://leetcode.com/problems/trips-and-users/
-- dfaisal solution : https://www.dsfaisal.com/articles/sql/leetcode-sql-problem-solving#574-winning-candidate--medium---leetcode
-- EverydayDataScience Video Solution : https://www.youtube.com/watch?v=b3LphTjCZ8o
CREATE SCHEMA Q1149 AUTHORIZATION username;
-- Creating Tables for Question:
CREATE TABLE IF NOT EXISTS Q1149.Views(
    article_id INT,
    author_id INT,
    viewer_id INT,
    view_date DATE
);
--------------------------------------------------------------------------
------------------------ Loading datas to tables: ------------------------
------------------------ TABLE : Person ------------------------
INSERT INTO Q1149.Views(article_id, author_id, viewer_id, view_date)
VALUES(
        1,
        3,
        5,
        '2019-08-01'
    );
INSERT INTO Q1149.Views(article_id, author_id, viewer_id, view_date)
VALUES(
        1,
        3,
        6,
        '2019-08-02'
    );
INSERT INTO Q1149.Views(article_id, author_id, viewer_id, view_date)
VALUES(
        2,
        7,
        7,
        '2019-08-01'
    );
INSERT INTO Q1149.Views(article_id, author_id, viewer_id, view_date)
VALUES(
        2,
        7,
        6,
        '2019-08-02'
    );
INSERT INTO Q1149.Views(article_id, author_id, viewer_id, view_date)
VALUES(
        4,
        7,
        1,
        '2019-07-22'
    );
INSERT INTO Q1149.Views(article_id, author_id, viewer_id, view_date)
VALUES(
        3,
        4,
        4,
        '2019-07-21'
    );
INSERT INTO Q1149.Views(article_id, author_id, viewer_id, view_date)
VALUES(
        3,
        4,
        4,
        '2019-07-21'
    );
--------------------------------------------------------------------------
------------------------ CHECK TABLES ------------------------
SELECT *
FROM Q1149.Views;
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