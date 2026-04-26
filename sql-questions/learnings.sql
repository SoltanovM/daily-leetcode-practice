--------------------------------------------------------------------------
--------------------------------------------------------------------------
--------------------------------------------------------------------------
-- RANK() :
--------------------
-- RANK() is a window function that assigns a rank to each row based on the
-- ORDER BY sequence of the window. Rows with identical values receive the same
-- rank, and the next rank skips ahead by the number of tied rows.
--------------------
-- DENSE_RANK() : 
--------------------
-- https://mariadb.com/kb/en/dense_rank/#:~:text=ORDER%20BY%20order_list%20%5D%20
-- Description
-- DENSE_RANK() is a window function that displays the number of a given row, 
-- starting at one and following the ORDER BY sequence of the window function, 
-- with identical values receiving the same result. Unlike the RANK() function, 
-- there are no skipped values if the preceding results are identical. It is also similar to the 
--------------------
-- ROW_NUMBER(): 
--------------------
-- ROW_NUMBER() function except that in that function, identical values will 
-- receive a different row number for each result.
-- Examples
CREATE TABLE IF NOT EXISTS student(course VARCHAR(10), mark int, name varchar(10));
INSERT INTO student
VALUES ('Maths', 60, 'Thulile'),
    ('Maths', 60, 'Pritha'),
    ('Maths', 70, 'Voitto'),
    ('Maths', 55, 'Chun'),
    ('Biology', 60, 'Bilal'),
    ('Biology', 70, 'Roger');
----------------------------------------------------------------------------
SELECT *
FROM student;
----------------------------------------------------------------------------
SELECT RANK() OVER (
        PARTITION BY course
        ORDER BY mark DESC
    ) AS rank,
    DENSE_RANK() OVER (
        PARTITION BY course
        ORDER BY mark DESC
    ) AS dense_rank,
    ROW_NUMBER() OVER (
        PARTITION BY course
        ORDER BY mark DESC
    ) AS row_num,
    course,
    mark,
    name
FROM student
ORDER BY course,
    mark DESC;

-- `GROUP BY` collapses rows into one row per group, so aggregate functions
-- like `COUNT()`, `SUM()`, or `MAX()` return a single result for each group.
-- `PARTITION BY` does not collapse rows; it only splits rows into logical
-- groups for window functions, and each original row is still returned.
--

CREATE TABLE example_student (
    course VARCHAR(50),
    name VARCHAR(50),
    mark INT
);

INSERT INTO example_student (course, name, mark) VALUES
    ('Math', 'Alice', 90),
    ('Math', 'Bob', 80),
    ('CS', 'Carol', 95),
    ('CS', 'Dave', 70);

SELECT * FROM example_student;

-- Using `GROUP BY course`:
SELECT course, MAX(mark) AS highest_mark
FROM example_student
GROUP BY course;

-- Using `PARTITION BY course`:
SELECT
    course,
    name,
    mark,
    MAX(mark) OVER (PARTITION BY course) AS highest_mark_in_course
FROM example_student;
