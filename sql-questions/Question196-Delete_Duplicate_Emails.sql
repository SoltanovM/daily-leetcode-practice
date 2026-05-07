-- Difficulty : Easy
-- Link to Leetcode Problem : https://leetcode.com/problems/delete-duplicate-emails/
-- EverydayDataScience Video Solution : https://www.youtube.com/watch?v=PLg7lF-BW5g
CREATE SCHEMA Q196 AUTHORIZATION username;
-- Creating Tables for Question:
CREATE TABLE IF NOT EXISTS Q196.Person(Id INT PRIMARY KEY, Email VARCHAR);
--------------------------------------------------------------------------
------------------------ Loading datas to tables: ------------------------
------------------------ TABLE : Person ------------------------
INSERT INTO Q196.Person(Id, Email)
VALUES(1, 'john@example.com');
INSERT INTO Q196.Person(Id, Email)
VALUES(2, 'bob@example.com');
INSERT INTO Q196.Person(Id, Email)
VALUES(3, 'john@example.com');
--------------------------------------------------------------------------
------------------------ CHECK TABLES ------------------------
SELECT *
FROM Q196.Person;
--------------------------------------------------------------------------
--------------------------------------------------------------------------
--------------------------------------------------------------------------
-------------------------- Problem Desciption: ---------------------------
'''
Write a solution to delete all duplicate emails, keeping only one unique email with the smallest id.

For SQL users, please note that you are supposed to write a DELETE statement and not a SELECT one.

For Pandas users, please note that you are supposed to modify Person in place.

After running your script, the answer shown is the Person table. 
The driver will first compile and run your piece of code and then show the Person table. 
The final order of the Person table does not matter.

The result format is in the following example.

Output: 
+----+------------------+
| id | email            |
+----+------------------+
| 1  | john@example.com |
| 2  | bob@example.com  |
+----+------------------+
Explanation: john@example.com is repeated two times. We keep the row with the smallest Id = 1.
''';
----------------------------- My Solution: ------------------------------
-- Write your MySQL query statement below
DELETE FROM Q196.Person
WHERE id IN (
        SELECT p2.id
        FROM Q196.Person p1
            JOIN Q196.Person p2 ON p1.Email = p2.Email
            AND p1.id < p2.id
    );
----------------------------- EverydayDataScience Solution: -------------
-- Write your MySQL query statement below