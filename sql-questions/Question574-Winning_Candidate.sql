-- Difficulty : Easy
-- Link to Leetcode Problem : https://leetcode.com/problems/trips-and-users/
-- dfaisal solution : https://www.dsfaisal.com/articles/sql/leetcode-sql-problem-solving#574-winning-candidate--medium---leetcode
-- EverydayDataScience Video Solution : https://www.youtube.com/watch?v=b3LphTjCZ8o
CREATE SCHEMA Q574 AUTHORIZATION username;
-- Creating Tables for Question:
CREATE TABLE IF NOT EXISTS Q574.Candidate(id INT PRIMARY KEY, name VARCHAR);
CREATE TABLE IF NOT EXISTS Q574.Vote(id INT PRIMARY KEY, CandidateId INT);
--------------------------------------------------------------------------
------------------------ Loading datas to tables: ------------------------
------------------------ TABLE : Candidate ------------------------
INSERT INTO Q574.Candidate(id, Name)
VALUES(1, 'A');
INSERT INTO Q574.Candidate(id, Name)
VALUES(2, 'B');
INSERT INTO Q574.Candidate(id, Name)
VALUES(3, 'C');
INSERT INTO Q574.Candidate(id, Name)
VALUES(4, 'D');
INSERT INTO Q574.Candidate(id, Name)
VALUES(5, 'E');
------------------------ TABLE : Vote ------------------------
INSERT INTO Q574.Vote(id, CandidateId)
VALUES(1, 2);
INSERT INTO Q574.Vote(id, CandidateId)
VALUES(2, 4);
INSERT INTO Q574.Vote(id, CandidateId)
VALUES(3, 3);
INSERT INTO Q574.Vote(id, CandidateId)
VALUES(4, 2);
INSERT INTO Q574.Vote(id, CandidateId)
VALUES(5, 5);
--------------------------------------------------------------------------
------------------------ CHECK TABLES ------------------------
SELECT *
FROM Q574.Candidate;
---
SELECT *
FROM Q574.Vote;
--------------------------------------------------------------------------
--------------------------------------------------------------------------
--------------------------------------------------------------------------
-------------------------- Problem Desciption: ---------------------------
'''
id is the auto-increment primary key, 
CandidateId is the id appeared in Candidate table. 
Write a sql to find the name of the winning candidate, 
the above example will return the winner B.
''';
----------------------------- My Solution: ------------------------------
-- Write your MySQL query statement below
----------------------------- frederikmuller Solution: -------------
-- Write your MySQL query statement below