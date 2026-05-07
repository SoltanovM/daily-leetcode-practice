-- Difficulty : Easy
-- Link to Leetcode Problem : https://leetcode.com/problems/trips-and-users/
-- dfaisal solution : https://www.dsfaisal.com/articles/sql/leetcode-sql-problem-solving#574-winning-candidate--medium---leetcode
-- EverydayDataScience Video Solution : https://www.youtube.com/watch?v=b3LphTjCZ8o
CREATE TYPE sex_enum AS ENUM ('m', 'f');
CREATE SCHEMA Q627 AUTHORIZATION username;
-- Creating Tables for Question:
CREATE TABLE IF NOT EXISTS Q627.salary(
    id INT PRIMARY KEY,
    name VARCHAR,
    sex sex_enum,
    salary INT
);
--------------------------------------------------------------------------
------------------------ Loading datas to tables: ------------------------
------------------------ TABLE : Person ------------------------
INSERT INTO Q627.salary(id, name, sex, salary)
VALUES(1, 'A', 'm', 2500);
INSERT INTO Q627.salary(id, name, sex, salary)
VALUES(2, 'B', 'f', 1500);
INSERT INTO Q627.salary(id, name, sex, salary)
VALUES(3, 'C', 'm', 5500);
INSERT INTO Q627.salary(id, name, sex, salary)
VALUES(4, 'D', 'f', 500);
--------------------------------------------------------------------------
------------------------ CHECK TABLES ------------------------
SELECT *
FROM Q627.salary;
--------------------------------------------------------------------------
--------------------------------------------------------------------------
--------------------------------------------------------------------------
-------------------------- Problem Desciption: ---------------------------
'''
Write a solution to swap all  f  and  m  values (i.e., change all  f  values to  m  and vice versa)
with a single update statement and no intermediate temporary tables.

Note that you must write a single update statement, do not write any select statement for this problem.

The result format is in the following example.

Output: 
+----+------+-----+--------+
| id | name | sex | salary |
+----+------+-----+--------+
| 1  | A    | f   | 2500   |
| 2  | B    | m   | 1500   |
| 3  | C    | f   | 5500   |
| 4  | D    | m   | 500    |
+----+------+-----+--------+
Explanation: 
(1, A) and (3, C) were changed from  m  to  f .
(2, B) and (4, D) were changed from  f  to  m .
''';
----------------------------- My Solution: ------------------------------
-- Write your MySQL query statement below
UPDATE Q627.salary
SET sex = CASE
        WHEN sex = 'm' THEN 'f'::sex_enum
        ELSE 'm'::sex_enum
    END;
----------------------------- frederikmuller Solution: -------------
-- Write your MySQL query statement below