--
-- @lc app=leetcode id=1050 lang=mysql
--
-- [1050] Actors and Directors Who Cooperated At Least Three Times
--
-- https://leetcode.com/problems/actors-and-directors-who-cooperated-at-least-three-times/description/
--
-- database
-- Easy (71.01%)
-- Likes:    793
-- Dislikes: 57
-- Total Accepted:    316.7K
-- Total Submissions: 445.7K
-- Testcase Example:  '{"headers":{"ActorDirector":["actor_id","director_id","timestamp"]},"rows":{"ActorDirector":[[1,1,0],[1,1,1],[1,1,2],[1,2,3],[1,2,4],[2,1,5],[2,1,6]]}}'
--
-- Table: ActorDirector
-- 
-- 
-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | actor_id    | int     |
-- | director_id | int     |
-- | timestamp   | int     |
-- +-------------+---------+
-- timestamp is the primary key (column with unique values) for this
-- table.
-- 
-- 
-- 
-- 
-- Write a solution to find all the pairs (actor_id, director_id) where the
-- actor has cooperated with the director at least three times.
-- 
-- Return the result table in any order.
-- 
-- The result format is in the following example.
-- 
-- 
-- Example 1:
-- 
-- 
-- Input: 
-- ActorDirector table:
-- +-------------+-------------+-------------+
-- | actor_id    | director_id | timestamp   |
-- +-------------+-------------+-------------+
-- | 1           | 1           | 0           |
-- | 1           | 1           | 1           |
-- | 1           | 1           | 2           |
-- | 1           | 2           | 3           |
-- | 1           | 2           | 4           |
-- | 2           | 1           | 5           |
-- | 2           | 1           | 6           |
-- +-------------+-------------+-------------+
-- Output: 
-- +-------------+-------------+
-- | actor_id    | director_id |
-- +-------------+-------------+
-- | 1           | 1           |
-- +-------------+-------------+
-- Explanation: The only pair is (1, 1) where they cooperated exactly 3 times.
-- 
-- 
--

-- @lc code=start
# Write your MySQL query statement below

select actor_id,director_id
from ActorDirector
group by actor_id,director_id
having count(*)>=3

-- @lc code=end

