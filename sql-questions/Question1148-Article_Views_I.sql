-- Difficulty : Easy
-- Link to Leetcode Problem : https://leetcode.com/problems/article-views-i/
CREATE SCHEMA Q1148 AUTHORIZATION username;
-- Creating Tables for Question:
CREATE TABLE IF NOT EXISTS Q1148.Views(
    article_id INT,
    author_id INT,
    viewer_id INT,
    view_date DATE
);
--------------------------------------------------------------------------
------------------------ Loading datas to tables: ------------------------
------------------------ TABLE : Person ------------------------
INSERT INTO Q1148.Views(article_id, author_id, viewer_id, view_date)
VALUES(
        1,
        3,
        5,
        '2019-08-01'
    );
INSERT INTO Q1148.Views(article_id, author_id, viewer_id, view_date)
VALUES(
        1,
        3,
        6,
        '2019-08-02'
    );
INSERT INTO Q1148.Views(article_id, author_id, viewer_id, view_date)
VALUES(
        2,
        7,
        7,
        '2019-08-01'
    );
INSERT INTO Q1148.Views(article_id, author_id, viewer_id, view_date)
VALUES(
        2,
        7,
        6,
        '2019-08-02'
    );
INSERT INTO Q1148.Views(article_id, author_id, viewer_id, view_date)
VALUES(
        4,
        7,
        1,
        '2019-07-22'
    );
INSERT INTO Q1148.Views(article_id, author_id, viewer_id, view_date)
VALUES(
        3,
        4,
        4,
        '2019-07-21'
    );
INSERT INTO Q1148.Views(article_id, author_id, viewer_id, view_date)
VALUES(
        3,
        4,
        4,
        '2019-07-21'
    );
--------------------------------------------------------------------------
------------------------ CHECK TABLES ------------------------
SELECT *
FROM Q1148.Views;
--------------------------------------------------------------------------
--------------------------------------------------------------------------
--------------------------------------------------------------------------
-------------------------- Problem Desciption: ---------------------------
'''
Write a solution to find all the authors that viewed at least one of their own articles.

Return the result table sorted by id in ascending order.

The result format is in the following example.

Output: 
+------+
| id   |
+------+
| 4    |
| 7    |
+------+
''';
----------------------------- My Solution: ------------------------------
-- Write your MySQL query statement below
SELECT DISTINCT v1.author_id AS id
FROM Q1148.Views AS v1
    INNER JOIN Q1148.Views AS v2 ON v1.author_id = v2.viewer_id;
----------------------------- frederikmuller Solution: -------------