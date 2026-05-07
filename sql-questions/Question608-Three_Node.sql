-- Difficulty : Easy
-- Link to Leetcode Problem : https://leetcode.com/problems/trips-and-users/
-- dfaisal solution : https://www.dsfaisal.com/articles/sql/leetcode-sql-problem-solving#574-winning-candidate--medium---leetcode
-- EverydayDataScience Video Solution : https://www.youtube.com/watch?v=b3LphTjCZ8o
CREATE SCHEMA Q608 AUTHORIZATION username;
-- Creating Tables for Question:
CREATE TABLE IF NOT EXISTS Q608.tree(id INT PRIMARY KEY, p_id INT);
--------------------------------------------------------------------------
------------------------ Loading datas to tables: ------------------------
------------------------ TABLE : tree ------------------------
INSERT INTO Q608.tree(id, p_id)
VALUES(1, NULL);
INSERT INTO Q608.tree(id, p_id)
VALUES(2, 1);
INSERT INTO Q608.tree(id, p_id)
VALUES(3, 1);
INSERT INTO Q608.tree(id, p_id)
VALUES(4, 2);
INSERT INTO Q608.tree(id, p_id)
VALUES(5, 2);
--------------------------------------------------------------------------
------------------------ CHECK TABLES ------------------------
SELECT *
FROM Q608.tree;
-- DROP TABLE Q608.tree;
--------------------------------------------------------------------------
--------------------------------------------------------------------------
--------------------------------------------------------------------------
-------------------------- Problem Desciption: ---------------------------
'''
Each node in the tree can be one of three types:

->    "Leaf": if the node is a leaf node.
->    "Root": if the node is the root of the tree.
->    "Inner": If the node is neither a leaf node nor a root node.

Write a solution to report the type of each node in the tree.

Return the result table in any order.

The result format is in the following example.

Output: 
+----+-------+
| id | type  |
+----+-------+
| 1  | Root  |
| 2  | Inner |
| 3  | Leaf  |
| 4  | Leaf  |
| 5  | Leaf  |
+----+-------+
Explanation: 
Node 1 is the root node because its parent node is null and it has child nodes 2 and 3.
Node 2 is an inner node because it has parent node 1 and child node 4 and 5.
Nodes 3, 4, and 5 are leaf nodes because they have parent nodes and they do not have child nodes.
''';
----------------------------- My Solution: ------------------------------
-- Write your MySQL query statement below
--------------------------------------------
ALTER TABLE Q608.tree
ADD COLUMN branch VARCHAR DEFAULT 'Inner';
--------------------------------------------
SELECT t1.id,
    CASE
        WHEN t1.p_id IS NULL THEN 'Root'
        WHEN MAX(t2.id) IS NULL THEN 'Leaf'
        ELSE 'Inner'
    END AS Type -- SELECT *    
FROM Q608.tree AS t1
    LEFT JOIN Q608.tree AS t2 ON t1.id = t2.p_id
GROUP BY t1.id,
    t1.p_id;
----------------------------- frederikmuller Solution: -------------
-- Write your MySQL query statement below