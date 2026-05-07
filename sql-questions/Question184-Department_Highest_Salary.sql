-- Difficulty : Medium
-- Link to Leetcode Problem : https://leetcode.com/problems/department-highest-salary/
-- EverydayDataScience Video Solution : https://www.youtube.com/watch?v=68PVQ4OzLuk
CREATE SCHEMA Q184 AUTHORIZATION username;
-- Creating Tables for Question:
CREATE TABLE IF NOT EXISTS Q184.Employee(
    Id INT PRIMARY KEY,
    Name VARCHAR,
    Salary INT,
    DepartmentId INT
);
CREATE TABLE IF NOT EXISTS Q184.Department(Id INT PRIMARY KEY, Name VARCHAR);
--------------------------------------------------------------------------
------------------------ Loading datas to tables: ------------------------
------------------------ TABLE : Employee ------------------------
INSERT INTO Q184.Employee(Id, Name, Salary, DepartmentId)
VALUES(1, 'Joe', 70000, 1);
INSERT INTO Q184.Employee(Id, Name, Salary, DepartmentId)
VALUES(2, 'Jim', 90000, 1);
INSERT INTO Q184.Employee(Id, Name, Salary, DepartmentId)
VALUES(3, 'Henry', 80000, 2);
INSERT INTO Q184.Employee(Id, Name, Salary, DepartmentId)
VALUES(4, 'Sam', 60000, 2);
INSERT INTO Q184.Employee(Id, Name, Salary, DepartmentId)
VALUES(5, 'Max', 90000, 1);
------------------------ TABLE : Department ------------------------
INSERT INTO Q184.Department(Id, Name)
VALUES(1, 'IT');
INSERT INTO Q184.Department(Id, Name)
VALUES(2, 'Sales');
--------------------------------------------------------------------------
------------------------ CHECK TABLES ------------------------
SELECT *
FROM Q184.Employee;
---
SELECT *
FROM Q184.Department;
--------------------------------------------------------------------------
--------------------------------------------------------------------------
--------------------------------------------------------------------------
-------------------------- Problem Desciption: ---------------------------
'''
Write a SQL query to find employees who have the highest salary in each of the departments. 
For the above tables, your SQL query should return the following rows (order of rows does not matter).

Output: 
+------------+----------+--------+
| Department | Employee | Salary |
+------------+----------+--------+
| IT         | Jim      | 90000  |
| Sales      | Henry    | 80000  |
| IT         | Max      | 90000  |
+------------+----------+--------+
Explanation: Max and Jim both have the highest salary in the IT department and Henry has the 
highest salary in the Sales department.
''';
----------------------------- My Solution: ------------------------------
-- # Write your MySQL query statement below
WITH department_max_salary AS (
    SELECT 
        MAX(e.salary) AS max_salary,
        e.departmentid AS department_id,
        d.name AS department
    FROM Q184.Employee AS e 
    LEFT JOIN Q184.Department AS d ON e.departmentid = d.id
    GROUP BY e.departmentid, d.name
)
SELECT 
    dms.department AS Department,
    e.name AS Employee,
    dms.max_salary AS Salary
FROM department_max_salary AS dms
LEFT JOIN Q184.Employee AS e ON e.salary = dms.max_salary AND e.departmentid = dms.department_id;



WITH department_max_salary AS (
    SELECT 
        MAX(e.salary) AS max_salary,
        e.departmentid AS department_id,
        d.name AS department
    FROM Employee AS e 
    LEFT JOIN Department AS d ON e.departmentid = d.id
    GROUP BY e.departmentid, d.name
)
SELECT 
    dms.department AS Department,
    e.name AS Employee,
    dms.max_salary AS Salary
FROM department_max_salary AS dms
LEFT JOIN Employee AS e ON e.salary = dms.max_salary AND e.departmentid = dms.department_id;



WITH joinedTable AS (
    SELECT d.name AS Department,
        e.name AS Employee,
        e.salary AS Salary,
        DENSE_RANK() OVER (
            PARTITION BY d.name
            ORDER BY e.salary DESC
        ) AS dense_rank
    FROM Q184.Employee AS e
        LEFT JOIN Q184.Department AS d ON e.departmentid = d.id
)
SELECT Department,
    Employee,
    Salary
FROM joinedTable
WHERE dense_rank = 1;
----------------------------- EverydayDataScience Solution: -------------
-- Write your MySQL query statement below