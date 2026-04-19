--
-- @lc app=leetcode id=619 lang=mysql
--
-- [619] Biggest Single Number
--
-- https://leetcode.com/problems/biggest-single-number/description/
--
-- database
-- Easy (71.10%)
-- Likes:    975
-- Dislikes: 203
-- Total Accepted:    553.9K
-- Total Submissions: 778.2K
-- Testcase Example:  '{"headers": {"MyNumbers": ["num"]}, "rows": {"MyNumbers": [[8],[8],[3],[3],[1],[4],[5],[6]]}}'
--
-- Table: MyNumbers
-- 
-- 
-- +-------------+------+
-- | Column Name | Type |
-- +-------------+------+
-- | num         | int  |
-- +-------------+------+
-- This table may contain duplicates (In other words, there is no primary key
-- for this table in SQL).
-- Each row of this table contains an integer.
-- 
-- 
-- 
-- 
-- A single number is a number that appeared only once in the MyNumbers table.
-- 
-- Find the largest single number. If there is no single number, report null.
-- 
-- The result format is in the following example.
-- ⁠
-- 
-- Example 1:
-- 
-- 
-- Input: 
-- MyNumbers table:
-- +-----+
-- | num |
-- +-----+
-- | 8   |
-- | 8   |
-- | 3   |
-- | 3   |
-- | 1   |
-- | 4   |
-- | 5   |
-- | 6   |
-- +-----+
-- Output: 
-- +-----+
-- | num |
-- +-----+
-- | 6   |
-- +-----+
-- Explanation: The single numbers are 1, 4, 5, and 6.
-- Since 6 is the largest single number, we return it.
-- 
-- 
-- Example 2:
-- 
-- 
-- Input: 
-- MyNumbers table:
-- +-----+
-- | num |
-- +-----+
-- | 8   |
-- | 8   |
-- | 7   |
-- | 7   |
-- | 3   |
-- | 3   |
-- | 3   |
-- +-----+
-- Output: 
-- +------+
-- | num  |
-- +------+
-- | null |
-- +------+
-- Explanation: There are no single numbers in the input table so we return
-- null.
-- 
-- 
--

-- @lc code=start
# Write your MySQL query statement below
select max(num) as num
from (
    select num
    from mynumbers
    group by num
    having count(*) = 1
) t;

-- @lc code=end

