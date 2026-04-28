--
-- @lc app=leetcode id=1729 lang=mysql
--
-- [1729] Find Followers Count
--
-- https://leetcode.com/problems/find-followers-count/description/
--
-- database
-- Easy (69.57%)
-- Likes:    762
-- Dislikes: 49
-- Total Accepted:    473.6K
-- Total Submissions: 680.5K
-- Testcase Example:  '{"headers":{"Followers":["user_id","follower_id"]},"rows":{"Followers":[["0","1"],["1","0"],["2","0"],["2","1"]]}}'
--
-- Table: Followers
-- 
-- 
-- +-------------+------+
-- | Column Name | Type |
-- +-------------+------+
-- | user_id     | int  |
-- | follower_id | int  |
-- +-------------+------+
-- (user_id, follower_id) is the primary key (combination of columns with
-- unique values) for this table.
-- This table contains the IDs of a user and a follower in a social media app
-- where the follower follows the user.
-- 
-- 
-- 
-- Write a solution that will, for each user, return the number of followers.
-- 
-- Return the result table ordered by user_id in ascending order.
-- 
-- The result format is in the following example.
-- 
-- 
-- Example 1:
-- 
-- 
-- Input: 
-- Followers table:
-- +---------+-------------+
-- | user_id | follower_id |
-- +---------+-------------+
-- | 0       | 1           |
-- | 1       | 0           |
-- | 2       | 0           |
-- | 2       | 1           |
-- +---------+-------------+
-- Output: 
-- +---------+----------------+
-- | user_id | followers_count|
-- +---------+----------------+
-- | 0       | 1              |
-- | 1       | 1              |
-- | 2       | 2              |
-- +---------+----------------+
-- Explanation: 
-- The followers of 0 are {1}
-- The followers of 1 are {0}
-- The followers of 2 are {0,1}
-- 
-- 
--

-- @lc code=start
# Write your MySQL query statement below

select user_id,count(follower_id) as followers_count
from Followers
group by user_id
order by user_id 

-- @lc code=end

