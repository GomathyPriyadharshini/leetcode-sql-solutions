--
-- @lc app=leetcode id=610 lang=mysql
--
-- [610] Triangle Judgement
--
-- https://leetcode.com/problems/triangle-judgement/description/
--
-- database
-- Easy (74.67%)
-- Likes:    865
-- Dislikes: 239
-- Total Accepted:    475.2K
-- Total Submissions: 636.1K
-- Testcase Example:  '{"headers":{"Triangle":["x","y","z"]},"rows":{"Triangle":[[13,15,30],[10,20,15]]}}'
--
-- Table: Triangle
-- 
-- 
-- +-------------+------+
-- | Column Name | Type |
-- +-------------+------+
-- | x           | int  |
-- | y           | int  |
-- | z           | int  |
-- +-------------+------+
-- In SQL, (x, y, z) is the primary key column for this table.
-- Each row of this table contains the lengths of three line segments.
-- 
-- 
-- 
-- 
-- Report for every three line segments whether they can form a triangle.
-- 
-- Return the result table in any order.
-- 
-- The result format is in the following example.
-- 
-- 
-- Example 1:
-- 
-- 
-- Input: 
-- Triangle table:
-- +----+----+----+
-- | x  | y  | z  |
-- +----+----+----+
-- | 13 | 15 | 30 |
-- | 10 | 20 | 15 |
-- +----+----+----+
-- Output: 
-- +----+----+----+----------+
-- | x  | y  | z  | triangle |
-- +----+----+----+----------+
-- | 13 | 15 | 30 | No       |
-- | 10 | 20 | 15 | Yes      |
-- +----+----+----+----------+
-- 
-- 
--

-- @lc code=start
# Write your MySQL query statement below

select *,
case when (x+y>z) and (y+z>x) and (z+x>y) then 'Yes'
else 'No'
end as triangle
from triangle

-- @lc code=end

