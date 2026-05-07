-- Difficulty : Easy
-- Link to Leetcode Problem : https://leetcode.com/problems/trips-and-users/
-- dfaisal solution : https://www.dsfaisal.com/articles/sql/leetcode-sql-problem-solving#574-winning-candidate--medium---leetcode
-- EverydayDataScience Video Solution : https://www.youtube.com/watch?v=b3LphTjCZ8o
CREATE SCHEMA Q162 AUTHORIZATION username;
-- Creating Tables for Question:
CREATE TYPE status_enum AS ENUM (
    'completed',
    'cancelled_by_driver',
    'cancelled_by_client'
);
CREATE TYPE banned_enum AS ENUM ('Yes', 'No');
CREATE TYPE role_enum AS ENUM ('client', 'driver', 'partner');
-------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Q162.Trips(
    Id INT PRIMARY KEY,
    Client_Id INT,
    Driver_Id INT,
    City_Id INT,
    Status status_enum,
    Request_at DATE
);
CREATE TABLE IF NOT EXISTS Q162.Users(
    Users_Id INT PRIMARY KEY,
    Banned banned_enum,
    Role role_enum
);
--------------------------------------------------------------------------
------------------------ Loading datas to tables: ------------------------
------------------------ TABLE : Person ------------------------
INSERT INTO Q162.Trips(
        Id,
        Client_Id,
        Driver_Id,
        City_Id,
        Status,
        Request_at
    )
VALUES (
        1,
        1,
        10,
        1,
        'completed',
        '2013-10-01'
    );
INSERT INTO Q162.Trips(
        Id,
        Client_Id,
        Driver_Id,
        City_Id,
        Status,
        Request_at
    )
VALUES (
        2,
        2,
        11,
        1,
        'cancelled_by_driver',
        '2013-10-01'
    );
INSERT INTO Q162.Trips(
        Id,
        Client_Id,
        Driver_Id,
        City_Id,
        Status,
        Request_at
    )
VALUES (
        3,
        3,
        12,
        6,
        'completed',
        '2013-10-01'
    );
INSERT INTO Q162.Trips(
        Id,
        Client_Id,
        Driver_Id,
        City_Id,
        Status,
        Request_at
    )
VALUES (
        4,
        4,
        13,
        6,
        'cancelled_by_client',
        '2013-10-01'
    );
INSERT INTO Q162.Trips(
        Id,
        Client_Id,
        Driver_Id,
        City_Id,
        Status,
        Request_at
    )
VALUES (
        5,
        1,
        10,
        1,
        'completed',
        '2013-10-02'
    );
INSERT INTO Q162.Trips(
        Id,
        Client_Id,
        Driver_Id,
        City_Id,
        Status,
        Request_at
    )
VALUES (
        6,
        2,
        11,
        6,
        'completed',
        '2013-10-02'
    );
INSERT INTO Q162.Trips(
        Id,
        Client_Id,
        Driver_Id,
        City_Id,
        Status,
        Request_at
    )
VALUES (
        7,
        3,
        12,
        6,
        'completed',
        '2013-10-02'
    );
INSERT INTO Q162.Trips(
        Id,
        Client_Id,
        Driver_Id,
        City_Id,
        Status,
        Request_at
    )
VALUES (
        8,
        2,
        12,
        12,
        'completed',
        '2013-10-03'
    );
INSERT INTO Q162.Trips(
        Id,
        Client_Id,
        Driver_Id,
        City_Id,
        Status,
        Request_at
    )
VALUES (
        9,
        3,
        10,
        12,
        'completed',
        '2013-10-03'
    );
INSERT INTO Q162.Trips(
        Id,
        Client_Id,
        Driver_Id,
        City_Id,
        Status,
        Request_at
    )
VALUES (
        10,
        4,
        13,
        12,
        'cancelled_by_driver',
        '2013-10-03'
    );
------------------------ TABLE : Users ------------------------
INSERT INTO Q162.Users(Users_Id, Banned, Role)
VALUES(1, 'No', 'client');
INSERT INTO Q162.Users(Users_Id, Banned, Role)
VALUES(2, 'Yes', 'client');
INSERT INTO Q162.Users(Users_Id, Banned, Role)
VALUES(3, 'No', 'client');
INSERT INTO Q162.Users(Users_Id, Banned, Role)
VALUES(4, 'No', 'client');
INSERT INTO Q162.Users(Users_Id, Banned, Role)
VALUES(10, 'No', 'driver');
INSERT INTO Q162.Users(Users_Id, Banned, Role)
VALUES(11, 'No', 'driver');
INSERT INTO Q162.Users(Users_Id, Banned, Role)
VALUES(12, 'No', 'driver');
INSERT INTO Q162.Users(Users_Id, Banned, Role)
VALUES(13, 'No', 'driver');
------------------------ TEST CASES ------------------------
DELETE FROM Q162.Trips;
DELETE FROM Q162.Users;
INSERT INTO Q162.Trips(
        Id,
        Client_Id,
        Driver_Id,
        City_Id,
        Status,
        Request_at
    )
VALUES (
        1,
        1,
        10,
        1,
        'cancelled_by_client',
        '2013-10-04'
    );
INSERT INTO Q162.Users(Users_Id, Banned, Role)
VALUES(1, 'No', 'client');
INSERT INTO Q162.Users(Users_Id, Banned, Role)
VALUES(10, 'No', 'driver');
--------------------------------------------------------------------------
------------------------ CHECK TABLES ------------------------
SELECT *
FROM Q162.Trips;
---
SELECT *
FROM Q162.Users;
--------------------------------------------------------------------------
--------------------------------------------------------------------------
--------------------------------------------------------------------------
-------------------------- Problem Desciption: ---------------------------
'''
The cancellation rate is computed by dividing the number of canceled (by client or driver) requests with
unbanned users by the total number of requests with unbanned users on that day.

Write a solution to find the cancellation rate of requests with unbanned users (both client and driver must not
be banned) each day between "2013-10-01" and "2013-10-03". Round Cancellation Rate to two decimal points.

Return the result table in any order.

The result format is in the following example.


Output: 
+------------+-------------------+
| Day        | Cancellation Rate |
+------------+-------------------+
| 2013-10-01 | 0.33              |
| 2013-10-02 | 0.00              |
| 2013-10-03 | 0.50              |
+------------+-------------------+
Explanation: 
On 2013-10-01:
  - There were 4 requests in total, 2 of which were canceled.
  - However, the request with Id=2 was made by a banned client (User_Id=2), so it is ignored in the calculation.
  - Hence there are 3 unbanned requests in total, 1 of which was canceled.
  - The Cancellation Rate is (1 / 3) = 0.33
On 2013-10-02:
  - There were 3 requests in total, 0 of which were canceled.
  - The request with Id=6 was made by a banned client, so it is ignored.
  - Hence there are 2 unbanned requests in total, 0 of which were canceled.
  - The Cancellation Rate is (0 / 2) = 0.00
On 2013-10-03:
  - There were 3 requests in total, 1 of which was canceled.
  - The request with Id=8 was made by a banned client, so it is ignored.
  - Hence there are 2 unbanned request in total, 1 of which were canceled.
  - The Cancellation Rate is (1 / 2) = 0.50

''';
----------------------------- My Solution: ------------------------------
-- Write your MySQL query statement below
WITH filteredTable AS (
    SELECT t.request_at,
        CASE
            WHEN (t.status = 'completed') THEN 0
            ELSE 1
        END AS rate
    FROM Q162.Trips AS t
        LEFT JOIN Q162.Users AS u on t.driver_id = u.users_id
        LEFT JOIN Q162.Users AS u2 on t.client_id = u2.users_id
    WHERE u.banned = 'No'
        AND u2.banned = 'No'
        AND t.request_at >= '2013-10-01'
        AND t.request_at <= '2013-10-03'
)
SELECT request_at AS "Day",
    ROUND(AVG(rate), 2) AS "Cancellation Rate"
FROM filteredTable
GROUP BY request_at;
----------------------------- frederikmuller Solution: -------------
-- Write your MySQL query statement below