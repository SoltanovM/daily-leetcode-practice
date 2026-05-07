-- Difficulty : Easy
-- Link to Leetcode Problem : https://leetcode.com/problems/trips-and-users/
-- dfaisal solution : https://www.dsfaisal.com/articles/sql/leetcode-sql-problem-solving#574-winning-candidate--medium---leetcode
-- EverydayDataScience Video Solution : https://www.youtube.com/watch?v=b3LphTjCZ8o
CREATE SCHEMA Q585 AUTHORIZATION username;
-- Creating Tables for Question:
CREATE TABLE IF NOT EXISTS Q585.Insurance(
    PID INT,
    TIV_2015 DECIMAL(15, 2),
    TIV_2016 DECIMAL(15, 2),
    LAT DECIMAL(5, 2),
    LON DECIMAL(5, 2)
);
--------------------------------------------------------------------------
------------------------ Loading datas to tables: ------------------------
------------------------ TABLE : Person ------------------------
INSERT INTO Q585.Insurance(PID, TIV_2015, TIV_2016, LAT, LON)
VALUES(1, 10, 5, 10, 10);
INSERT INTO Q585.Insurance(PID, TIV_2015, TIV_2016, LAT, LON)
VALUES(2, 20, 20, 20, 20);
INSERT INTO Q585.Insurance(PID, TIV_2015, TIV_2016, LAT, LON)
VALUES(3, 10, 30, 20, 20);
INSERT INTO Q585.Insurance(PID, TIV_2015, TIV_2016, LAT, LON)
VALUES(4, 10, 40, 40, 40);
--------------------------------------------------------------------------
------------------------ CHECK TABLES ------------------------
-- DELETE FROM Q585.Insurance; 
SELECT *
FROM Q585.Insurance;
-- DROP TABLE Q585.tiv_2016
--------------------------------------------------------------------------
--------------------------------------------------------------------------
--------------------------------------------------------------------------
-------------------------- Problem Desciption: ---------------------------
'''
Write a solution to report the sum of all total investment values in 2016 tiv_2016, for all policyholders who:

-> have the same tiv_2015 value as one or more other policyholders, and
-> are not located in the same city as any other policyholder (i.e., the (lat, lon) attribute pairs must be unique).

Round tiv_2016 to two decimal places.

The result format is in the following example.

Output: 
+----------+
| tiv_2016 |
+----------+
| 45.00    |
+----------+
Explanation: 
The first record in the table, like the last record, meets both of the two criteria.
The tiv_2015 value 10 is the same as the third and fourth records, 
and its location is unique.

The second record does not meet any of the two criteria. 
Its tiv_2015 is not like any other policyholders and its location is the
same as the third record, which makes the third record fail, too.
So, the result is the sum of tiv_2016 of the first and last record, which is 45.

''';
----------------------------- My Solution: ------------------------------
-- # Write your MySQL query statement below
WITH diff_locations AS (
    SELECT CONCAT(LAT, '; ', LON) AS located_at
    FROM Q585.Insurance
    GROUP BY LAT,
        LON
    HAVING COUNT(1) = 1
),
filteredTable AS (
    SELECT tiv_2015
    FROM Q585.Insurance
    GROUP BY tiv_2015
    HAVING COUNT(1) > 1
)
SELECT ROUND(SUM(t.tiv_2016)::NUMERIC, 2) AS tiv_2016
FROM Q585.Insurance AS t
WHERE CONCAT(LAT, '; ', LON) IN (
        SELECT located_at
        FROM diff_locations
    )
    AND tiv_2015 in (
        SELECT tiv_2015
        FROM filteredTable
    );
----------------------------- frederikmuller Solution: -------------
-- Write your MySQL query statement below