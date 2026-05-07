-- Difficulty : Easy
-- Link to Leetcode Problem : https://leetcode.com/problems/department-highest-salary/
-- EverydayDataScience Video Solution : https://www.youtube.com/watch?v=68PVQ4OzLuk
CREATE SCHEMA Q185 AUTHORIZATION username;
-- Creating Tables for Question:
CREATE TABLE IF NOT EXISTS Q185.Employee(
    Id INT PRIMARY KEY,
    Name VARCHAR,
    Salary INT,
    DepartmentId INT
);
CREATE TABLE IF NOT EXISTS Q185.Department(Id INT PRIMARY KEY, Name VARCHAR);
--------------------------------------------------------------------------
------------------------ Loading datas to tables: ------------------------
------------------------ TABLE : Employee ------------------------
INSERT INTO Q185.Employee(Id, Name, Salary, DepartmentId)
VALUES(1, 'Joe', 85000, 1);
INSERT INTO Q185.Employee(Id, Name, Salary, DepartmentId)
VALUES(2, 'Henry', 80000, 2);
INSERT INTO Q185.Employee(Id, Name, Salary, DepartmentId)
VALUES(3, 'Sam', 60000, 2);
INSERT INTO Q185.Employee(Id, Name, Salary, DepartmentId)
VALUES(4, 'Max', 90000, 1);
INSERT INTO Q185.Employee(Id, Name, Salary, DepartmentId)
VALUES(5, 'Janet', 69000, 1);
INSERT INTO Q185.Employee(Id, Name, Salary, DepartmentId)
VALUES(6, 'Randy', 85000, 1);
INSERT INTO Q185.Employee(Id, Name, Salary, DepartmentId)
VALUES(7, 'Will', 70000, 1);
------------------------ TABLE : Department ------------------------
INSERT INTO Q185.Department(Id, Name)
VALUES(1, 'IT');
INSERT INTO Q185.Department(Id, Name)
VALUES(2, 'Sales');
--------------------------------------------------------------------------
------------------------ CHECK TABLES ------------------------
SELECT *
FROM Q185.Employee;
---
SELECT *
FROM Q185.Department;
--------------------------------------------------------------------------
--------------------------------------------------------------------------
--------------------------------------------------------------------------
-------------------------- Problem Desciption: ---------------------------
'''
A company_s executives are interested in seeing who earns the most money in each of the company_s departments. 
A high earner in a department is an employee who has a salary in the top three unique salaries for that department.

Write a solution to find the employees who are high earners in each of the departments.

Return the result table in any order.

The result format is in the following example.

Output: 
+------------+----------+--------+
| Department | Employee | Salary |
+------------+----------+--------+
| IT         | Max      | 90000  |
| IT         | Joe      | 85000  |
| IT         | Randy    | 85000  |
| IT         | Will     | 70000  |
| Sales      | Henry    | 80000  |
| Sales      | Sam      | 60000  |
+------------+----------+--------+
Explanation: 
In the IT department:
- Max earns the highest unique salary
- Both Randy and Joe earn the second-highest unique salary
- Will earns the third-highest unique salary

In the Sales department:
- Henry earns the highest salary
- Sam earns the second-highest salary
- There is no third-highest salary as there are only two employees

''';
----------------------------- My Solution: ------------------------------
-- Write your MySQL query statement below
WITH joinedTable AS (
    SELECT d.name AS Department,
        e.name AS Employee,
        e.salary AS Salary,
        DENSE_RANK() OVER (
            PARTITION BY d.name
            ORDER BY e.salary DESC
        ) AS dense_rank
    FROM Q185.Employee AS e
        LEFT JOIN Q185.Department AS d ON e.departmentid = d.id
)
SELECT Department,
    Employee,
    Salary
FROM joinedTable
WHERE dense_rank <= 3;
----------------------------- EverydayDataScience Solution: -------------
-- Write your MySQL query statement below