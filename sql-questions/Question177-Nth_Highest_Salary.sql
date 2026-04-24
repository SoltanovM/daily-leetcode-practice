-- Difficulty : Medium
-- Link to Leetcode Problem : https://leetcode.com/problems/nth-highest-salary/
-- EverydayDataScience Video Solution : https://www.youtube.com/watch?v=jNSGAS2lIvE
CREATE SCHEMA Q177 AUTHORIZATION username;
-- Creating Tables for Question:
CREATE TABLE IF NOT EXISTS Q177.Employee(Id INT PRIMARY KEY, Salary INT);
--------------------------------------------------------------------------
------------------------ Loading datas to tables: ------------------------
------------------------ TABLE : Person ------------------------
INSERT INTO Q177.Employee(Id, Salary)
VALUES(1, 100);
INSERT INTO Q177.Employee(Id, Salary)
VALUES(2, 200);
INSERT INTO Q177.Employee(Id, Salary)
VALUES(3, 300);
--------------------------------------------------------------------------
------------------------ CHECK TABLES ------------------------
SELECT *
FROM Q177.Employee;
--------------------------------------------------------------------------
--------------------------------------------------------------------------
--------------------------------------------------------------------------
-------------------------- Problem Desciption: ---------------------------
'''
For example, given the above Employee table, the nth highest salary where n = 2 is 200. 
If there is no nth highest salary, then the query should return null.
''';
----------------------------- My Solution: ------------------------------
CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT BEGIN RETURN(
    result;
);
END;
-- Write your MySQL query statement below
----------------------------- EverydayDataScience Solution: -------------
CREATE OR REPLACE FUNCTION NthHighestSalary(N INT) RETURNS TABLE (Salary INT) AS $$ BEGIN RETURN QUERY (
        WITH RANKED_SALARIES AS (
            SELECT Salary,
                DENSE_RANK() OVER (
                    ORDER BY Salary DESC
                ) AS DENSERANK
            FROM Q177.Employee
        )
        SELECT CASE
                WHEN (
                    SELECT COUNT(DISTINCT Salary)
                    FROM RANKED_SALARIES
                ) < N THEN NULL
                ELSE (
                    SELECT Salary
                    FROM RANKED_SALARIES
                    WHERE DENSERANK = N
                    LIMIT 1
                )
            END -- AS SecondHighestSalary;
    );
END;
$$ LANGUAGE plpgsql;
------------------------------------------------
SELECT NthHighestSalary(1);
DROP FUNCTION IF EXISTS NthHighestSalary(INT);
CREATE OR REPLACE FUNCTION NthHighestSalary(N INT) RETURNS TABLE (Salary INT) AS $$ BEGIN RETURN QUERY (
        WITH RANKED_SALARIES AS (
            SELECT Salary,
                DENSE_RANK() OVER (
                    ORDER BY Salary DESC
                ) AS DENSERANK
            FROM Q177.Employee
        )
        SELECT CASE
                WHEN (
                    SELECT COUNT(DISTINCT Salary)
                    FROM RANKED_SALARIES
                ) < N THEN NULL
                ELSE (
                    SELECT R.Salary
                    FROM RANKED_SALARIES R
                    WHERE R.DENSERANK = N
                    LIMIT 1
                )
            END
    );
END;
$$ LANGUAGE plpgsql;
------------------------------ Function Creation in PostgreSQL : ------------------------------
DROP FUNCTION IF EXISTS getNthHighestSalary(INT);
CREATE OR REPLACE FUNCTION getNthHighestSalary(N INT) RETURNS TABLE (s INT) AS $$ BEGIN RETURN QUERY (
        SELECT salary
        FROM Q177.Employee
        ORDER BY salary DESC
        LIMIT 1 OFFSET N - 1
    );
END;
$$ LANGUAGE plpgsql;
SELECT getNthHighestSalary(2) AS result;
----------------------------------------------------------
----------------------------------------------------------
CREATE OR REPLACE FUNCTION add_numbers (a INT, b INT) RETURNS INT AS $$ BEGIN RETURN a + b;
END;
$$ LANGUAGE plpgsql;
----------------------------------------------------------
SELECT add_numbers(3, 5) AS result;