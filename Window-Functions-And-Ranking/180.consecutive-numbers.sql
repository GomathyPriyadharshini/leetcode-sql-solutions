--
-- @lc app=leetcode id=180 lang=mysql
--
-- [180] Consecutive Numbers
--
-- https://leetcode.com/problems/consecutive-numbers/description/
--
-- database
-- Medium (48.12%)
-- Likes:    2739
-- Dislikes: 363
-- Total Accepted:    759.6K
-- Total Submissions: 1.6M
-- Testcase Example:  '{"headers":{"Logs":["id","num"]},"rows":{"Logs":[[1,1],[2,1],[3,1],[4,2],[5,1],[6,2],[7,2]]}}'
--
-- Table: Logs
-- 
-- 
-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | id          | int     |
-- | num         | varchar |
-- +-------------+---------+
-- In SQL, id is the primary key for this table.
-- id is an autoincrement column starting from 1.
-- 
-- 
-- 
-- 
-- Find all numbers that appear at least three times consecutively.
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
-- Logs table:
-- +----+-----+
-- | id | num |
-- +----+-----+
-- | 1  | 1   |
-- | 2  | 1   |
-- | 3  | 1   |
-- | 4  | 2   |
-- | 5  | 1   |
-- | 6  | 2   |
-- | 7  | 2   |
-- +----+-----+
-- Output: 
-- +-----------------+
-- | ConsecutiveNums |
-- +-----------------+
-- | 1               |
-- +-----------------+
-- Explanation: 1 is the only number that appears consecutively for at least
-- three times.
-- 
-- 
--

-- @lc code=start
# Write your MySQL query statement below


select round(sum(tiv_2016),2) as tiv_2016 from 
(
    select tiv_2016,
    count(*) over (partition by tiv_2015) as ct_2015,
    count(*) over (partition by lat,lon) as ct_lat_lon
    from insurance

)a
where ct_2015>1
and ct_lat_lon=1


-- @lc code=end

