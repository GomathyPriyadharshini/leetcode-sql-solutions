--
-- @lc app=leetcode id=1667 lang=mysql
--
-- [1667] Fix Names in a Table
--
-- https://leetcode.com/problems/fix-names-in-a-table/description/
--
-- database
-- Easy (60.60%)
-- Likes:    1088
-- Dislikes: 143
-- Total Accepted:    457.1K
-- Total Submissions: 754.5K
-- Testcase Example:  '{"headers":{"Users":["user_id","name"]},"rows":{"Users":[[1,"aLice"],[2,"bOB"]]}}'
--
-- Table: Users
-- 
-- 
-- +----------------+---------+
-- | Column Name    | Type    |
-- +----------------+---------+
-- | user_id        | int     |
-- | name           | varchar |
-- +----------------+---------+
-- user_id is the primary key (column with unique values) for this table.
-- This table contains the ID and the name of the user. The name consists of
-- only lowercase and uppercase characters.
-- 
-- 
-- 
-- 
-- Write a solution to fix the names so that only the first character is
-- uppercase and the rest are lowercase.
-- 
-- Return the result table ordered by user_id.
-- 
-- The result format is in the following example.
-- 
-- 
-- Example 1:
-- 
-- 
-- Input: 
-- Users table:
-- +---------+-------+
-- | user_id | name  |
-- +---------+-------+
-- | 1       | aLice |
-- | 2       | bOB   |
-- +---------+-------+
-- Output: 
-- +---------+-------+
-- | user_id | name  |
-- +---------+-------+
-- | 1       | Alice |
-- | 2       | Bob   |
-- +---------+-------+
-- 
-- 
--

-- @lc code=start
# Write your MySQL query statement below

select user_id,concat(substring(upper(name),1,1),substring(lower(name),2)) as name from users
order by user_id

-- @lc code=end

