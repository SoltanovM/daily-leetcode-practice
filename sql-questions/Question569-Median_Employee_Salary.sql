-- Difficulty : Easy
-- Link to Leetcode Problem : https://leetcode.com/problems/trips-and-users/
-- dfaisal solution : https://www.dsfaisal.com/articles/sql/leetcode-sql-problem-solving#574-winning-candidate--medium---leetcode
-- EverydayDataScience Video Solution : https://www.youtube.com/watch?v=b3LphTjCZ8o
CREATE SCHEMA Q569 AUTHORIZATION username;
-- Creating Tables for Question:
CREATE TABLE IF NOT EXISTS Q569.Employee(
    Id INT PRIMARY KEY,
    Company VARCHAR,
    Salary INT
);
--------------------------------------------------------------------------
------------------------ Loading datas to tables: ------------------------
------------------------ TABLE : Employee ------------------------
INSERT INTO Q569.Employee(Id, Company, Salary)
VALUES(1, 'A', 2341);
INSERT INTO Q569.Employee(Id, Company, Salary)
VALUES(2, 'A', 341);
INSERT INTO Q569.Employee(Id, Company, Salary)
VALUES(3, 'A', 15);
INSERT INTO Q569.Employee(Id, Company, Salary)
VALUES(4, 'A', 15314);
INSERT INTO Q569.Employee(Id, Company, Salary)
VALUES(5, 'A', 451);
INSERT INTO Q569.Employee(Id, Company, Salary)
VALUES(6, 'A', 513);
INSERT INTO Q569.Employee(Id, Company, Salary)
VALUES(7, 'B', 15);
INSERT INTO Q569.Employee(Id, Company, Salary)
VALUES(8, 'B', 13);
INSERT INTO Q569.Employee(Id, Company, Salary)
VALUES(9, 'B', 1154);
INSERT INTO Q569.Employee(Id, Company, Salary)
VALUES(10, 'B', 1345);
INSERT INTO Q569.Employee(Id, Company, Salary)
VALUES(11, 'B', 1221);
INSERT INTO Q569.Employee(Id, Company, Salary)
VALUES(12, 'B', 234);
INSERT INTO Q569.Employee(Id, Company, Salary)
VALUES(13, 'C', 2345);
INSERT INTO Q569.Employee(Id, Company, Salary)
VALUES(14, 'C', 2645);
INSERT INTO Q569.Employee(Id, Company, Salary)
VALUES(15, 'C', 2645);
INSERT INTO Q569.Employee(Id, Company, Salary)
VALUES(16, 'C', 2652);
INSERT INTO Q569.Employee(Id, Company, Salary)
VALUES(17, 'C', 65);
--------------------------------------------------------------------------
------------------------ CHECK TABLES ------------------------
SELECT *
FROM Q569.Employee;
--------------------------------------------------------------------------
--------------------------------------------------------------------------
--------------------------------------------------------------------------
-------------------------- Problem Desciption: ---------------------------
'''
Write a SQL query to find the median salary of each company. Bonus points if you can solve it without using any built-in SQL functions.
+-----+------------+--------+
|Id   | Company    | Salary |
+-----+------------+--------+
|5    | A          | 451    |
|6    | A          | 513    |
|12   | B          | 234    |
|9    | B          | 1154   |
|14   | C          | 2645   |
+-----+------------+--------+

''';
----------------------------- My Solution: ------------------------------
-- Write your MySQL query statement below
SELECT t1.Id AS Id,
    t1.Company,
    t1.Salary -- SELECT *
FROM Q569.Employee AS t1
    JOIN Q569.Employee AS t2 ON t1.Company = t2.Company
GROUP BY t1.Id
HAVING abs(
        sum(
            CASE
                WHEN t2.Salary < t1.Salary THEN 1
                WHEN t2.Salary > t1.Salary THEN -1
                WHEN t2.Salary = t1.Salary
                AND t2.Id < t1.Id THEN 1
                WHEN t2.Salary = t1.Salary
                AND t2.Id > t1.Id THEN -1
                ELSE 0
            END
        )
    ) <= 1
ORDER BY t1.Company,
    t1.Salary,
    t1.Id;
----------------------------- frederikmuller Solution: -------------
-- Write your MySQL query statement below