-- Difficulty : Easy
-- Link to Leetcode Problem : https://leetcode.com/problems/employees-earning-more-than-their-managers/
-- EverydayDataScience Video Solution : https://www.youtube.com/watch?v=wlnOgs0PT_8
CREATE SCHEMA Q181 AUTHORIZATION username;
-- Creating Tables for Question:
CREATE TABLE IF NOT EXISTS Q181.Employee(
    Id INT PRIMARY KEY,
    Name VARCHAR,
    Salary INT,
    ManagerId INT
);
--------------------------------------------------------------------------
------------------------ Loading datas to tables: ------------------------
------------------------ TABLE : Person ------------------------
INSERT INTO Q181.Employee(Id, Name, Salary, ManagerId)
VALUES(1, 'Joe', 70000, 3);
INSERT INTO Q181.Employee(Id, Name, Salary, ManagerId)
VALUES(2, 'Henry', 80000, 4);
INSERT INTO Q181.Employee(Id, Name, Salary, ManagerId)
VALUES(3, 'Sam', 60000, NULL);
INSERT INTO Q181.Employee(Id, Name, Salary, ManagerId)
VALUES(4, 'Max', 90000, NULL);
--------------------------------------------------------------------------
------------------------ CHECK TABLES ------------------------
SELECT *
FROM Q181.Employee;
--------------------------------------------------------------------------
--------------------------------------------------------------------------
--------------------------------------------------------------------------
-------------------------- Problem Desciption: ---------------------------
'''
The Employee table holds all employees including their managers. 
Every employee has an Id, and there is also a column for the manager Id.

Given the Employee table, write a SQL query that finds out employees who earn more than their managers. 
For the above table, 
Joe is the only employee who earns more than his manager.

Output: 
+----------+
| Employee |
+----------+
| Joe      |
+----------+
Explanation: Joe is the only employee who earns more than his manager.
''';
----------------------------- My Solution: ------------------------------
SELECT 
    -- e1.id AS employee_id,
    -- e1.name AS employee_name,
    -- e1.salary AS employee_salary,
    -- e2.id AS manager_id,
    -- e2.name AS manager_name,
    -- e2.salary AS manager_salary
    e1.name AS employee
FROM Q181.Employee AS e1
LEFT JOIN Q181.employee AS e2 on e1.managerid = e2.id
WHERE e1.salary>e2.salary;


SELECT 
    e1.name AS Employee
FROM Employee AS e1
LEFT JOIN Employee AS e2 on e1.managerid = e2.id
WHERE e1.salary>e2.salary;




-- Write your MySQL query statement below
WITH JoinedTable AS (
    SELECT t1.name,
        t1.salary,
        t2.name as his_maneger,
        t2.salary as manager_s_salary
    FROM Q181.Employee AS t1
        INNER JOIN Q181.Employee AS t2 ON t1.managerid = t2.id
)
SELECT JoinedTable.name AS Employee
FROM JoinedTable
WHERE JoinedTable.salary > JoinedTable.manager_s_salary;
----------------------------- EverydayDataScience Solution: -------------
-- Write your MySQL query statement below