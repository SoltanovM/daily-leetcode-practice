-- Difficulty : Easy
-- Link to Leetcode Problem : https://leetcode.com/problems/trips-and-users/
-- dfaisal solution : https://www.dsfaisal.com/articles/sql/leetcode-sql-problem-solving#574-winning-candidate--medium---leetcode
-- EverydayDataScience Video Solution : https://www.youtube.com/watch?v=b3LphTjCZ8o
CREATE TYPE platform_enum AS ENUM('desktop', 'mobile');
CREATE SCHEMA Q1127 AUTHORIZATION username;
-- Creating Tables for Question:
CREATE TABLE IF NOT EXISTS Q1127.Spending(
    user_id INT,
    spend_date DATE,
    platform platform_enum,
    amount INT
);
--------------------------------------------------------------------------
------------------------ Loading datas to tables: ------------------------
------------------------ TABLE : Person ------------------------
INSERT INTO Q1127.Spending(user_id, spend_date, platform, amount)
VALUES(1, '2019-07-01', 'mobile', 100);
INSERT INTO Q1127.Spending(user_id, spend_date, platform, amount)
VALUES(1, '2019-07-01', 'desktop', 100);
INSERT INTO Q1127.Spending(user_id, spend_date, platform, amount)
VALUES(2, '2019-07-01', 'mobile', 100);
INSERT INTO Q1127.Spending(user_id, spend_date, platform, amount)
VALUES(2, '2019-07-02', 'mobile', 100);
INSERT INTO Q1127.Spending(user_id, spend_date, platform, amount)
VALUES(3, '2019-07-01', 'desktop', 100);
INSERT INTO Q1127.Spending(user_id, spend_date, platform, amount)
VALUES(3, '2019-07-02', 'desktop', 100);
--------------------------------------------------------------------------
------------------------ CHECK TABLES ------------------------
SELECT *
FROM Q1127.Spending;
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